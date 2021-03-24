//************************************************************************************
//Map vars
//************************************************************************************
L.mapbox.accessToken = 'pk.eyJ1IjoiZGxvdXJpZG8wNCIsImEiOiJja21rdnl3djExNTNnMnZudjB3YjczN3p1In0.1-nfeWTB_fC57UNRqjAK3g';
const options = {
    minZoom:2,
    worldCopyJump: true,
}
let map = L.mapbox.map('map',undefined,options).setView([24.849604,-113.0105373], 4);

L.mapbox.styleLayer('mapbox://styles/mapbox/light-v9',{
    attribution: 'Team: GPerry, DValencia, DLourido',
}).addTo(map);
/* ** End map vars ******************************************************************/

let layerPeopleGroup = new L.layerGroup().addTo(map);
let layers;

L.mapbox.featureLayer()
    .loadURL('/users/people')
    .on('ready', function(e) {
        layers = e.target;
        controlLayer();
    });


let colors = [];
colors['COL'] = '#006F73';
colors['CRI'] = '#FF5D33';
colors['USA'] = '#827717';

function controlLayer() {
    console.log('holis');
    layerPeopleGroup.clearLayers();
    let clusterGroup = new L.MarkerClusterGroup().addTo(layerPeopleGroup);
    layers.eachLayer(function(layer) {

        console.log('holis -2');
        new L.marker(
            layer.feature.geometry.coordinates,
            {icon: new L.Icon({ iconSize: [50, 50], iconUrl: '/images/icon_female.png', iconAnchor:[25, 25]})}
        ).addTo(clusterGroup)
            .on('click', function(e){ updateModalInfo(layer.feature.properties)});
    });
}

function updateModalInfo(props){
    console.log('holis');
}