$(document).ready(function () {
    crearTablaHumedadAire();
    crearTablaTemperatura();
    crearTablaHumedadTierra();
    setPlantasUsuario();
    $('.user').text(localStorage.getItem("usuario"));   
    $('.welcome').text("Bienvenido, "+localStorage.getItem("usuario"));   
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
            var label = [];
            for (var i = 1; i <= response.length; i++) {
                label.push(i);
            }
            var ctx = $('#GraficaHumedadAire');

            const config = {
                type: 'line',
                data: {
                    labels: label,
                    datasets: [{
                        label: 'Nivel de humedad',
                        data: response,
                        borderColor: '#c54560',
                        backgroundColor: '#ff6384',
                        fill:true
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
                    },
                    interaction: {
                        mode: 'index',
                        intersect: false
                      }, 
                    scales: {
                        x: {
                          display: true,
                          title: {
                            display: true,
                            text: 'Nº Medida'
                          }
                        },
                        y: {
                          display: true,
                          title: {
                            display: true,
                            text: 'Valor'
                          }
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
            var label = [];
            for (var i = 1; i <= response.length; i++) {
                label.push(i);
            }
            var ctx = $('#GraficaTemperatura')

            const config = {
                type: 'line',
                data: {
                    labels: label,
                    datasets: [{
                        label: 'Temperatura',
                        data: response,
                        borderColor: '#308bc9',
                        backgroundColor: '#36a2eb',
                        fill:true                    
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
                    },
                    interaction: {
                        mode: 'index',
                        intersect: false
                      }, 
                    scales: {
                        x: {
                          display: true,
                          title: {
                            display: true,
                            text: 'Nº Medida'
                          }
                        },
                        y: {
                          display: true,
                          title: {
                            display: true,
                            text: 'Valor'
                          }
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
            var label = [];
            for (var i = 1; i <= response.length; i++) {
                label.push(i);
            }
            var ctx = $('#GraficaHumedadTierra')

            const config = {
                type: 'line',
                data: {
                    labels: label,
                    datasets: [{
                        label: 'Humedad de la tierra',
                        data: response,
                        borderColor: '#a34ecc',
                        backgroundColor: '#cc65fe',
                        fill:true            
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
                    },
                    interaction: {
                        mode: 'index',
                        intersect: false
                      }, 
                    scales: {
                        x: {
                          display: true,
                          title: {
                            display: true,
                            text: 'Nº Medida'
                          }
                        },
                        y: {
                          display: true,
                          title: {
                            display: true,
                            text: 'Valor'
                          }
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
