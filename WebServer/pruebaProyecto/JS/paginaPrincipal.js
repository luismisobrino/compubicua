$(document).ready(function () {
    crearTablaHumedadAire();
    crearTablaTemperatura();
    crearTablaHumedadTierra();
    setPlantasUsuario();
    $('.user').text("Bienvenido, "+localStorage.getItem("usuario"));   
    $('.plantaSeleccionada').text("Planta seleccionada: "+plantas[idPlanta]); 
    
});
let idPlanta=1;
let plantas;
let tablaHumedadAire;
let tablaTemperatura;
let tablaHumedadTierra;

function setPlantasUsuario(){
    $.ajax({
        data: {usuario: localStorage.getItem('usuario')},
        url: "GetPlantasUsuario",
        error: function (jpXHR, textStatus, errorThrown) { },
        type: 'post',
        async: false,
        success: (response) => {
            response = JSON.parse(response);                                    
            plantas=response;
            var list= document.getElementById("submenu2");
            for(var i in response){
                var li= document.createElement('li');                
                li.innerHTML="<a onclick='javascript:seleccionarPlanta("+i+")' class='nav-link px-0'> <span class='cambioColor d-none d-sm-inline' >"+response[i]+"</span></a>"
                list.appendChild(li);
            }
        }
    })
}
function crearTablaHumedadAire() {
    $.ajax({
        data: {idPlanta:idPlanta},
        url: "ChartHumedadAire",
        error: function (jpXHR, textStatus, errorThrown) { },
        type: 'post',
        async: false,
        success: (response) => {
            response = JSON.parse(response);

            var ctx = $('#GraficaHumedadAire');

            const config = {
                type: 'line',
                data: {
                    labels: response,
                    datasets: [{
                        label: 'Nivel de humedad',
                        data: response
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        title: {
                            display: true,
                            text: 'Historico de humedad del aire'
                        }
                    }
                },
            };
            if (tablaHumedadAire instanceof Chart) {
                tablaHumedadAire.destroy();
            }
            tablaHumedadAire = new Chart(ctx, config)
        }
    })
}
function crearTablaTemperatura() {
    $.ajax({
        data: {idPlanta:idPlanta},
        url: "ChartTemperatura",
        error: function (jpXHR, textStatus, errorThrown) { },
        type: 'post',
        async: false,
        success: (response) => {
            response = JSON.parse(response);

            var ctx = $('#GraficaTemperatura')

            const config = {
                type: 'line',
                data: {
                    labels: response,
                    datasets: [{
                        label: 'Temperatura',
                        data: response
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        title: {
                            display: true,
                            text: 'Historico de temperatura'
                        }
                    }
                },
            };
            if (tablaTemperatura instanceof Chart) {
                tablaTemperatura.destroy();
            }
            tablaTemperatura = new Chart(ctx, config)
        }
    })
}

function crearTablaHumedadTierra() {
    $.ajax({
        data: {idPlanta:idPlanta},
        url: "ChartHumedadTierra",
        error: function (jpXHR, textStatus, errorThrown) { },
        type: 'post',
        async: false,
        success: (response) => {
            response = JSON.parse(response);

            var ctx = $('#GraficaHumedadTierra')

            const config = {
                type: 'line',
                data: {
                    labels: response,
                    datasets: [{
                        label: 'Humedad de la tierra',
                        data: response
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        title: {
                            display: true,
                            text: 'Historico de humedad de la tierra'
                        }
                    }
                },
            };
            if (tablaHumedadTierra instanceof Chart) {
                tablaHumedadTierra.destroy();
            }
            tablaHumedadTierra = new Chart(ctx, config)
        }
    })
}
function seleccionarPlanta(id){
    idPlanta=id
    $('.plantaSeleccionada').text("Planta seleccionada: "+plantas[idPlanta]); 
    crearTablaHumedadAire();
    crearTablaTemperatura();
    crearTablaHumedadTierra();
}

//setInterval(crearTablaHumedad, 3000);    
