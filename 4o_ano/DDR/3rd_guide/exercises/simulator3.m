function [PL , APD , MPD , TT] = simulator3(lambda,C,f,P,b)
% INPUT PARAMETERS:
%  lambda - packet rate (packets/sec)
%  C      - link bandwidth (Mbps)
%  f      - queue size (Bytes)
%  P      - number of packets (stopping criterium)
%  b      - bit error rate
% OUTPUT PARAMETERS:
%  PL   - packet loss (%)
%  APD  - average packet delay (milliseconds)
%  MPD  - maximum packet delay (milliseconds)
%  TT   - transmitted throughput (Mbps)

somatorio=1 + 10/5 + 10/5 * 5/10;
p1=1 / somatorio;
p2=10/5 / somatorio;
p3=10/5 * 5/10 / somatorio;
t=1/10; %t é igual em qualquer estado; t1 = 1/10, t2 = 1/(5+5), t3 = 1/10

%Events:
ARRIVAL= 0;       % Arrival of a packet            
DEPARTURE= 1;     % Departure of a packet
TRANSITION = 2;   % The transition of a state in the packet arriving Markov chain

%State variables:
STATE = 0;          % 0 - connection free; 1 - connection bysy
QUEUEOCCUPATION= 0; % Occupation of the queue (in Bytes)
QUEUE= [];          % Size and arriving time instant of each packet in the queue
FLOWSTATE = 0;      % (integer variable that can be 1, 2 or 3 indicating which is the current state of the packet arriving Markov chain 
lambda_vector = [0.5 * lambda, lambda, 1.5 * lambda];

%Statistical Counters:
TOTALPACKETS= 0;       % No. of packets arrived to the system
LOSTPACKETS= 0;        % No. of packets dropped due to buffer overflow
TRANSMITTEDPACKETS= 0; % No. of transmitted packets
TRANSMITTEDBYTES= 0;   % Sum of the Bytes of transmitted packets
DELAYS= 0;             % Sum of the delays of transmitted packets
MAXDELAY= 0;           % Maximum delay among all transmitted packets

%Auxiliary variables:
% Initializing the simulation clock:
Clock= 0;

x=rand;                             % random value to know the markov chain state
if x<=p1
    FLOWSTATE=1;
    EventList = [ARRIVAL, Clock + exprnd(1/(lambda/2)), GeneratePacketSize(), 0];
elseif x<=p1+p2
    FLOWSTATE=2;
    EventList = [ARRIVAL, Clock + exprnd(1/lambda), GeneratePacketSize(), 0];
else
    FLOWSTATE=3;
    EventList = [ARRIVAL, Clock + exprnd(1/(lambda*3/2)), GeneratePacketSize(), 0];
end
% Initializing the List of Events with the first ARRIVAL:
EventList = [EventList; TRANSITION, Clock + exprnd(t), 0, 0];

%Similation loop:
while TRANSMITTEDPACKETS<P               % Stopping criterium
    EventList= sortrows(EventList,2);    % Order EventList by time
    Event= EventList(1,1);               % Get first event and 
    Clock= EventList(1,2);               %   and
    PacketSize= EventList(1,3);          %   associated
    ArrivalInstant= EventList(1,4);      %   parameters.
    EventList(1,:)= [];                  % Eliminate first event
    
    
    switch Event
        case ARRIVAL                     % If first event is an ARRIVAL
            TOTALPACKETS= TOTALPACKETS+1;
            EventList = [EventList; ARRIVAL, Clock + exprnd(1/lambda_vector(FLOWSTATE)), GeneratePacketSize(), 0];
            if STATE==0
                STATE= 1;
                EventList = [EventList; DEPARTURE, Clock + 8*PacketSize/(C*10^6), PacketSize, Clock];
            else
                if QUEUEOCCUPATION + PacketSize <= f
                    QUEUE= [QUEUE;PacketSize , Clock];
                    QUEUEOCCUPATION= QUEUEOCCUPATION + PacketSize;
                else
                    LOSTPACKETS= LOSTPACKETS + 1;
                end
            end
        case DEPARTURE                     % If first event is a DEPARTURE
            P_error = (1-b)^(8*PacketSize);
            x=rand();
            if x<P_error
                TRANSMITTEDBYTES= TRANSMITTEDBYTES + PacketSize;
                DELAYS= DELAYS + (Clock - ArrivalInstant);
                if Clock - ArrivalInstant > MAXDELAY
                    MAXDELAY= Clock - ArrivalInstant;
                end
                TRANSMITTEDPACKETS= TRANSMITTEDPACKETS + 1;
            else
                LOSTPACKETS= LOSTPACKETS + 1;
            end
            if QUEUEOCCUPATION > 0
                EventList = [EventList; DEPARTURE, Clock + 8*QUEUE(1,1)/(C*10^6), QUEUE(1,1), QUEUE(1,2)];
                QUEUEOCCUPATION= QUEUEOCCUPATION - QUEUE(1,1);
                QUEUE(1,:)= [];
            else
                STATE= 0;
            end
        case TRANSITION
            EventList = [EventList; TRANSITION, Clock + exprnd(t), 0, 0];
            if FLOWSTATE~=2
                FLOWSTATE=2;
            else
                if rand > 0.5 %probabilidade de transição será 5 / (5+5) para ambos os estados
                    FLOWSTATE = 3;
                else
                    FLOWSTATE = 1;
                end
            end
            
    end
end

%Performance parameters determination:
PL= 100*LOSTPACKETS/TOTALPACKETS;      % in %
APD= 1000*DELAYS/TRANSMITTEDPACKETS;   % in milliseconds
MPD= 1000*MAXDELAY;                    % in milliseconds
TT= 10^(-6)*TRANSMITTEDBYTES*8/Clock;  % in Mbps

end

function out= GeneratePacketSize()
    aux= rand();
    aux2= [65:109 111:1517];
    if aux <= 0.16
        out= 64;
    elseif aux <= 0.16 + 0.25
        out= 110;
    elseif aux <= 0.16 + 0.25 + 0.2
        out= 1518;
    else
        out = aux2(randi(length(aux2)));
    end
end