function [b_hd b_4k]= simulator2(lambda,p,n,S,W,R,fname)
    %lambda = request arrival rate (in requests per hour)
    %p      = percentage of requests for 4K movies (in %)
    %n      = number of servers
    %S      = interface capacity of each server (in Mbps)
    %W      = resource reservation for 4K movies (in Mbps)
    %R      = number of movie requests to stop simulation
    %fname  = file name with the duration (in minutes) of the items
    
    invlambda=60/lambda;     %average time between requests (in minutes)
    invmiu= load(fname);     %duration (in minutes) of each movie
    Nmovies= length(invmiu); % number of movies
    
    %Events definition:
    ARRIVAL= 0;        %movie request
    DEPARTURE_HD= 1;      %termination of an hd movie transmission
    DEPARTURE_4K= 2;       %termination of a 4k movie transmission
    %State variables initialization:
    STATE= zeros(1,n);
    STATE_HD= 0; % n*S-W
    %Statistical counters initialization:
    REQUESTS_HD= 0;
    REQUESTS_4K= 0;
    BLOCKED_HD= 0;
    BLOCKED_4K= 0;
    %Simulation Clock and initial List of Events:
    Clock= 0;
    EventList= [ARRIVAL exprnd(invlambda) 0];
    RR_HD = n*S-W; % resource reservation for HD movies (in Mbps)
    
    while REQUESTS_HD + REQUESTS_4K < R
        event= EventList(1,1);
        Clock= EventList(1,2);
        server= EventList(1,3);
        
        EventList(1,:)= [];
        x = rand;
        if event == ARRIVAL
            [a, server] = min(STATE);
            if(x>p)
                %hd
                EventList= [EventList; ARRIVAL Clock+exprnd(invlambda) 0];
                REQUESTS_HD= REQUESTS_HD+1;
                if STATE(server) + 5 <= S && STATE_HD + 5 <= RR_HD
                    STATE(server) = STATE(server) + 5;
                    STATE_HD = STATE_HD + 5;
                    EventList= [EventList; DEPARTURE_HD Clock+invmiu(randi(Nmovies)) server];
                else
                    BLOCKED_HD= BLOCKED_HD+1;
                end
            else
                %4k
                EventList= [EventList; ARRIVAL Clock+exprnd(invlambda) 0];
                REQUESTS_4K= REQUESTS_4K+1;
                if STATE(server) + 25 <= S
                    STATE(server) = STATE(server)+25;
                    EventList= [EventList; DEPARTURE_4K Clock+invmiu(randi(Nmovies)) server];
                else
                    BLOCKED_4K= BLOCKED_4K+1;
                end
            end
        else
            if(event == DEPARTURE_HD)
                STATE(server) = STATE(server) - 5;
                STATE_HD = STATE_HD - 5;
            else
                STATE(server) = STATE(server) - 25;
            end
        end
        EventList= sortrows(EventList,2);   % order by time
    end
    b_hd = 100*BLOCKED_HD/REQUESTS_HD;    % blocking of HD movies probability in %
    b_4k = 100*BLOCKED_4K/REQUESTS_4K;    % blocking of 4K movies probability in %
end