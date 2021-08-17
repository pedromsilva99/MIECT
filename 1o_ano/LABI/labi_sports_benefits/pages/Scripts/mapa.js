var map = new L.Map("mapa", {center: [40.633258,-8.659097],zoom: 15});
var osmUrl="http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
var osmAttrib="Map data  OpenStreetMap contributors";
var osm = new L.TileLayer(osmUrl, {attribution: osmAttrib});
map.on("click", mostraCoordenadas);
function mostraCoordenadas(e){
var s = document.getElementById("coordenadas");
	s.innerHTML = "Latitude, Longitude = "+e.latlng.lat+", "+e.latlng.lng;
}
var pontos = [
	L.marker([40.633402, -8.652077]).bindPopup("Estádio Mário Duarte"),
	L.marker([40.638739, -8.656594]).bindPopup("Clube de Ténis de Aveiro"),
	L.marker([40.639736, -8.646959]).bindPopup("Dynamic Life Academy - Ginásio"),
	L.marker([40.644360, -8.651401]).bindPopup("Gim Tónico - Ginásio"),
	L.marker([40.638809, -8.646975]).bindPopup("Pavilhão desportivo")
	];
for (i in pontos) {
	pontos[i].addTo(map);
}
var grupo = new L.featureGroup(pontos);
map.fitBounds(grupo.getBounds());
map.addLayer(osm);
