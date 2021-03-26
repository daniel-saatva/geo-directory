//************************************************************************************
//Map vars
//************************************************************************************
L.mapbox.accessToken = 'pk.eyJ1IjoiZGxvdXJpZG8wNCIsImEiOiJja21rdnl3djExNTNnMnZudjB3YjczN3p1In0.1-nfeWTB_fC57UNRqjAK3g';
const options = {
    minZoom:2,
    worldCopyJump: true,
}
let map = L.mapbox.map('map',undefined,options).setView([20.3911177,-84.042094], 4);

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

function controlLayer() {
    layerPeopleGroup.clearLayers();
    let clusterGroup = new L.MarkerClusterGroup().addTo(layerPeopleGroup);
    layers.eachLayer(function(layer) {
        new L.marker(
            layer.feature.geometry.coordinates,
            {icon: new L.Icon({ iconSize: [45, 45], iconUrl: layer.feature.properties.photo_url || '/assets/avatar.png', className: "circle-image", iconAnchor:[30, 30]})}
        ).addTo(clusterGroup)
            .on('click', function(e){ updateModalInfo(layer.feature.properties)});
    });
}

function updateModalInfo(props){
    let names = document.getElementsByClassName('people_name');
    for (let element of names) {
        element.innerHTML = props.name
    }

    let profilePicture = document.getElementById('profile-picture');
    profilePicture.src= props.photo_url || '/assets/avatar.png';

    let email = document.getElementById('people_email');
    email.innerHTML = props.email;

    let skills = "";
    for (let skill of props.skills) {
        skills += '<span class="btn btn-sm btn-primary">' + skill + '</span> ';
    }
    let tags = document.getElementById('people_tags');
    tags.innerHTML = skills;

    let phone = document.getElementById('people_phone');
    phone.innerHTML = props.phone;

    let birthdate = document.getElementById('people_birth_date');
    birthdate.innerHTML = props.birth_date != null ? '<i class="fa fa-birthday-cake"></i> ' + props.birth_date + '<br/>': '';

    let start_date = document.getElementById('people_start_date');
    start_date.innerHTML = props.start_date;

    let squad = document.getElementById('people_squad');
    squad.innerHTML = props.squad != null ? '<i class="fa fa-users"></i> ' + props.squad + '<br/>' : '';

    let role = document.getElementById('people_role');
    role.innerHTML = props.role;

    let modal = new bootstrap.Modal(document.getElementById('people_info'), {
        keyboard: false
    });
    modal.show();
}

function toggleSides(){
    let backSide = document.getElementById('backside');

}
