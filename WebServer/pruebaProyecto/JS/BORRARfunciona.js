$(document).ready(function () {
    //crearTablaHumedad();
    crearTablaTemperatura();
});

let tablaHumedad;
let tablaTemperatura;
function crearTablaHumedad() {
    $.ajax({
        data: {},
        url: "PruebaChart",
        error: function (jpXHR, textStatus, errorThrown) { },
        type: 'post',
        async: false,
        success: (response) => {
            response = JSON.parse(response);

            var ctx = $('#chart1');

            const config = {
                type: 'line',
                data: {
                    labels: response,
                    datasets: [{
                        label: 'Prueba',
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
                            text: 'Chart.js Line Chart'
                        }
                    }
                },
            };
            if (tablaHumedad instanceof Chart) {
                tablaHumedad.destroy();
            }
            tablaHumedad = new Chart(ctx, config)
        }
    })
}
function crearTablaTemperatura() {
    $.ajax({
        data: {},
        url: "PruebaChart",
        error: function (jpXHR, textStatus, errorThrown) { },
        type: 'post',
        async: false,
        success: (response) => {
            response = JSON.parse(response);

            var ctx = $('#chart2')

            const config = {
                type: 'line',
                data: {
                    labels: response,
                    datasets: [{
                        label: 'Prueba',
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
                            text: 'Chart.js Line Chart'
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




//setInterval(crearTablaHumedad, 3000);    
