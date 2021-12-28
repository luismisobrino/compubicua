$(document).ready(function () {
    console.log('sasdfasdf')


});
function cambiarTitulo() {
    $.ajax({
        data: {},
        url: "ServletAjax",
        error: function (jpXHR, textStatus, errorThrown) { },
        type: 'post',
        async: false,
        success: (response) => {
            response = JSON.parse(response);
            $('#titulo').text(response);
        }
    })
}
function crearTablaHumedad() {
    $.ajax({
        data: {},
        url: "PruebaChart",
        error: function (jpXHR, textStatus, errorThrown) { },
        type: 'post',
        async: false,
        success: (response) => {
            response = JSON.parse(response);  
            console.log(response)                      
            lineChart(response);
        }
    })
}

let myChart; //Variable global para poder actualizar el mismo canvas varias veces

function lineChart(data) {
    
    var ctx = $('#myChart')
    const config = {
        type: 'line',
        data: {
            labels:data,
            datasets:[{
                label: 'Prueba',
                data:data
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
    if(myChart instanceof Chart){
        myChart.destroy();
    }
    myChart= new Chart(ctx,config)
    
}
setInterval(cambiarTitulo, 1000);
setInterval(crearTablaHumedad,5000);
