//************************************************************************************
//Map vars
//************************************************************************************
L.mapbox.accessToken = 'pk.eyJ1IjoiZGxvdXJpZG8wNCIsImEiOiJja21rdnl3djExNTNnMnZudjB3YjczN3p1In0.1-nfeWTB_fC57UNRqjAK3g';
let options = {
    minZoom:2,
    worldCopyJump: true,
}
let map = L.mapbox.map('map',undefined,options).setView([0.5286709, 27.2723167], 3);

L.mapbox.styleLayer('mapbox://styles/mapbox/light-v9',{
    attribution: 'Team: GPerry, DValencia, DLourido',
}).addTo(map);
/* ** End map vars ******************************************************************/