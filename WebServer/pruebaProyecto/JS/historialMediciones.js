$(document).ready(function () {    
    setPlantasUsuario();   
    $('.user').text(localStorage.getItem("usuario"));       
    $('.plantaSeleccionada').text("Planta seleccionada: "+plantas[idPlanta]);  
    
});
let idPlanta;
let plantas;
function seleccionarPlanta(id){
    idPlanta=id
    rellenarTabla();
    $('.plantaSeleccionada').text("Planta seleccionada: "+plantas[idPlanta]); 
   
}

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
            let primera=null;
            for(var i in response){   
                if(!primera) primera=i
                var li= document.createElement('li');                
                li.innerHTML="<a onclick='javascript:seleccionarPlanta("+i+")' class='nav-link px-0'> <span class='cambioColor d-none d-sm-inline' >"+response[i]+"</span></a>"
                list.appendChild(li);
            }
            seleccionarPlanta(primera)
        }
    })
}

function rellenarTabla(){
    $.ajax({
        data: {idPlanta: idPlanta},
        url: "GetHistorial",
        error: function (jpXHR, textStatus, errorThrown) { },
        type: 'post',
        async: false,
        success: (response) => {
            response = JSON.parse(response);                                               
            var table= document.getElementById("rows");
            if(document.getElementById('tbody')){
                document.getElementById('tbody').remove();                
            }

            var body= document.createElement('tbody');
            body.setAttribute("id","tbody");

            for(var i of Array(response[0].length).keys()){
                var tr= document.createElement('tr');                
                for(var p in response){
                    tr.innerHTML+="<td>"+response[p][i]+"</td>";                    
                    body.appendChild(tr);
                }                                
            }
            table.appendChild(body);
        }
    })
}