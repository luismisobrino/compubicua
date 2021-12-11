<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">  
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="CSS/bootstrap.min.css" rel="stylesheet">

    <title>Página de inicio Plants & Co.</title>
  </head>
  <body>
    <div class="container-fluid bg-primary " style="color:#ededed" >
        <!-- Izquierda -->
        <div>
            <img src="img/logosmart.png" width = "75px" layout="fill">
        </div>    
        <!-- Medio -->
        <span class="fs-5 mx-5 align-content text-end d-none d-sm-inline ">Plants & Co.</span>  
        <!-- Derecha -->

    </div> 
        <div class="container-fluid">
            <div class="row flex-nowrap">
                <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-primary">
                    <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                        <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                            <li class="nav-item">
                                <a href="#" class="nav-link align-middle px-0">
                                    <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline" style="color: #ededed">Menú de control</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0 align-middle">
                                    <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline" style="color: #ededed">Previsión actual</span></a>
                            </li>
                            <li>
                                <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                                    <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline "style="color: #ededed">Historial de mediciones</span> </a>
                                <ul class="collapse nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                                    <li class="w-100">
                                        <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline" style="color: #ededed">Planta 1</span ></a>
                                    </li>
                                    <li>
                                        <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline" style="color: #ededed">Planta 2</span></a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                                    <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline" style="color: #ededed">Historial de riegos</span></a>
                                <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                                    <li class="w-100">
                                        <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline" style="color: #ededed">Planta 1</span></a>
                                    </li>
                                    <li>
                                        <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline" style="color: #ededed">Planta 2</span></a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                                    <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline" style="color: #ededed">Mis plantas</span> </a>
                                    <ul class="collapse nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
                                    <li class="w-100">
                                        <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline" style="color: #ededed">Planta 1</span></a>
                                    </li>
                                    <li>
                                        <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline" style="color: #ededed">Planta 2</span></a>
                                    </li>
                                    <li>
                                        <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline" style="color: #ededed">Planta 3</span></a>
                                    </li>
                                    <li>
                                        <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline" style="color: #ededed">Planta 4</span></a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0 align-middle">
                                    <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline" style="color: #ededed">Acerca de nosotros</span> </a>
                            </li>
                        </ul>
                        <hr>
                        <div class="dropdown pb-4">
                            <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="img/usuario.png" alt="hugenerd" width="30" height="30" class="rounded-circle">
                                <span class="d-none d-sm-inline mx-1">Usuario</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                                <li><a class="dropdown-item" href="#">Cambiar ubicación</a></li>
                                <li><a class="dropdown-item" href="#">Modificar porcentaje de riego</a></li>
                                <li><a class="dropdown-item" href="#">Editar nombre de la planta</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Cerrar sesión</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col py-3">
                    <h3>Página principal de la aplicación</h3>
                    <p class="lead">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam aliquam architecto, in odio perferendis, iusto, corporis facere maxime cupiditate similique suscipit quaerat! Inventore alias iusto minus esse qui nemo nihil!</p>
                    <ul class="list-unstyled">
                        <li><h5>Utilidad</h5> Aquí iremos introduciendo las características que queramos</li>
                    </ul>
                </div>
            </div>
        </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
  </body>
</html>