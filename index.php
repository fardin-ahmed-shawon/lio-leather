<?php
// database connection
include 'database/dbConnection.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce | Home</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/cartbar.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/productList.css">

    <!--========== Remixicon ==========-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    <style>
        .card {
            cursor: pointer;
        }
    </style>

</head>
<body>

<?php
// header file
include 'header.php';
// cart bar
include 'cartBar.php';
?>

<!--==========================================-->
<!--============ START HOME SECTION ==========-->
<!--==========================================-->
<div class="pb-5 js-waypoint-sticky">

    <!-- Carousel Slider Area -->
    <div class="img-carousel-area">
        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="img/1.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="img/2.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="img/3.jpg" class="d-block w-100" alt="...">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <!-- Info Area -->
    <div class="info-area">
        <div class="container">
            <div class="row py-5 d-none d-md-flex">
                <div class="col-md-3 text-center p-3">
                    <i class="info-icons fa-solid fa-hand-holding-dollar"></i>
                    <h5>Cash On Delivery</h5>
                    <p>COD in whole Bangladesh</p>
                </div>
                <div class="col-md-3 text-center p-3">
                    <i class="info-icons fa-solid fa-people-carry-box"></i>
                    <h5>Easy return</h5>
                    <p>Easy return facility for any problem</p>
                </div>
                <div class="col-md-3 text-center p-3">
                    <i class="info-icons fa-solid fa-truck"></i>
                    <h5>Fast Delivery</h5>
                    <p>Delivery in 1 day within Dhaka, 2 days outside Dhaka</p>
                </div>
                <div class="col-md-3 text-center p-3">
                    <i class="info-icons fa-solid fa-headset"></i>
                    <h5>24/7 Support</h5>
                    <p>24 hours live support at your service</p>
                  </div>
            </div>
        </div>
    </div>

    <!-- Category List Area -->
    <section class="category py-5 bg-gray1">
        <div class="container">
            <h1>Categories</h1>
            <p>Explore all the product categories</p>
            <br><br>
            <!-- Category Card -->
            <div class="grid-container">
            <?php 
                $sql = "SELECT * FROM main_category";
                $result = mysqli_query($conn, $sql);
                
                while ($category = mysqli_fetch_array($result)) {
                    echo "<div class='card category-card'>
                            <div class='card-body'><br>
                                <h1>{$category['main_ctg_name']}</h1>
                                <a href='category.php?main_ctg_id={$category['main_ctg_id']}'>
                                    <button class='btn'>
                                        <h1><i class='ri-arrow-right-s-line'></i></h1>
                                    </button>
                                </a>
                            </div>
                        </div>";
                }
            ?>
            </div>
        </div>
    </section>

    <!-- New Arrival Area -->
     <section class="new-arrival py-5">
        <div class="container">
            <div class="grid-container-2x">
                <div class="title-align-left">
                    <h1>New Arrival Products</h1>
                    <p>Explore all the new product</p>
                </div>
                <div class="btn-align-end">
                    <a href="category.php">
                        <button class="btn btn-dark btn-see-all">See All The Procuts <i class="ri-arrow-right-line"></i></button>
                    </a>
                </div>
            </div>
            <br><hr><br>
            <div class="grid-container new-arrival-products">
                <!-- All Product Card Will Add Here Dynamically -->
                <?php
                    $sql = "SELECT product_info.*, main_category.main_ctg_name 
                            FROM product_info 
                            JOIN main_category 
                            ON product_info.main_ctg_id = main_category.main_ctg_id";
                    $result = mysqli_query($conn, $sql);
                    
                    $products = array();
                    while ($item = mysqli_fetch_array($result)) {
                        echo "<div class='card' product-id='$item[product_id]' product-title='$item[product_title]' product-img='img/$item[product_img1]' product-price='$item[product_price]' product-quantity='1'>
                        <img onclick='window.location.href=\"product.php?pi=$item[product_id]\"' src='img/$item[product_img1]' class='card-img-top' alt='img'>
                        <div class='card-body'>
                            <h6 onclick='window.location.href=\"product.php?pi=$item[product_id]\"'>$item[product_title]</h6>
                            <p onclick='window.location.href=\"product.php?pi=$item[product_id]\"'>$item[main_ctg_name]</p>
                            <h6 onclick='window.location.href=\"product.php?pi=$item[product_id]\"'>Tk. $item[product_price]</h6>
                            <button onclick='addToCart(this)' class='btn btn-outline-dark'><span>Add to Cart</span> <i class='ri-shopping-bag-line'></i></button>
                            <a href='product.php?pi=$item[product_id]'>
                                <button class='btn btn-dark'><span>Order Now</span> <i class='ri-shopping-cart-2-line'></i></button>
                            </a>
                        </div>
                    </div>";
                    }
                ?>
            </div>
        </div>
     </section>

    <!-- Top Selling Product -->
    <section class="top-selling py-5 bg-gray1">
        <div class="container">
            <div class="grid-container-2x">
                <div class="title-align-left">
                    <h1>Top Selling Products</h1>
                    <p>Explore all the top selling product</p>
                </div>
                <div class="btn-align-end">
                    <a href="category.php">
                        <button class="btn btn-dark btn-see-all">See All The Procuts <i class="ri-arrow-right-line"></i></button>
                    </a>
                </div>
            </div>
            <br><hr><br>
            <div class="grid-container top-selling-products">
                <!-- All Product Card Will Add Here Dynamically -->
                <?php
                    $sql = "SELECT product_info.*, main_category.main_ctg_name 
                            FROM product_info 
                            JOIN main_category 
                            ON product_info.main_ctg_id = main_category.main_ctg_id";
                    $result = mysqli_query($conn, $sql);
                    
                    $products = array();
                    while ($item = mysqli_fetch_array($result)) {
                        echo "<div class='card' product-id='$item[product_id]' product-title='$item[product_title]' product-img='img/$item[product_img1]' product-price='$item[product_price]' product-quantity='1'>
                        <img onclick='window.location.href=\"product.php?pi=$item[product_id]\"' src='img/$item[product_img1]' class='card-img-top' alt='img'>
                        <div class='card-body'>
                            <h6 onclick='window.location.href=\"product.php?pi=$item[product_id]\"'>$item[product_title]</h6>
                            <p onclick='window.location.href=\"product.php?pi=$item[product_id]\"'>$item[main_ctg_name]</p>
                            <h6 onclick='window.location.href=\"product.php?pi=$item[product_id]\"'>Tk. $item[product_price]</h6>
                            <button onclick='addToCart(this)' class='btn btn-outline-dark'><span>Add to Cart</span> <i class='ri-shopping-bag-line'></i></button>
                            <a href='product.php?pi=$item[product_id]'>
                                <button class='btn btn-dark'><span>Order Now</span> <i class='ri-shopping-cart-2-line'></i></button>
                            </a>
                        </div>
                    </div>";
                    }
                ?>
            </div>
        </div>
    </section>
     
    <!--=====================================================-->
    <!--============= All Category List & Items =============-->
    <div class="all-categories">
        
        <!-- Men's Fashion -->
        <section class="py-5">
            <div class="container">
                <div class="grid-container-2x">
                    <div class="title-align-left">
                        <h1>Men's Fashion</h1>
                        <p>Explore all the men's product</p>
                    </div>
                    <div class="btn-align-end">
                        <button onclick="window.location.href='category.php';" class="btn btn-dark btn-see-all">See All The Procuts <i class="ri-arrow-right-line"></i></button>
                    </div>
                </div>
                <br><hr><br>
                <div class="grid-container home-mens-fashion-products">
                    <!-- All Product Card Will Add Here Dynamically -->
                    <?php
                        $sql = "SELECT product_info.*, main_category.main_ctg_name 
                                FROM product_info 
                                JOIN main_category 
                                ON product_info.main_ctg_id = main_category.main_ctg_id";
                        $result = mysqli_query($conn, $sql);
                        
                        $products = array();
                        while ($item = mysqli_fetch_array($result)) {
                            echo "<div class='card' product-id='$item[product_id]' product-title='$item[product_title]' product-img='img/$item[product_img1]' product-price='$item[product_price]' product-quantity='1'>
                            <img onclick='window.location.href=\"product.php?pi=$item[product_id]\"' src='img/$item[product_img1]' class='card-img-top' alt='img'>
                            <div class='card-body'>
                                <h6 onclick='window.location.href=\"product.php?pi=$item[product_id]\"'>$item[product_title]</h6>
                                <p onclick='window.location.href=\"product.php?pi=$item[product_id]\"'>$item[main_ctg_name]</p>
                                <h6 onclick='window.location.href=\"product.php?pi=$item[product_id]\"'>Tk. $item[product_price]</h6>
                                <button onclick='addToCart(this)' class='btn btn-outline-dark'><span>Add to Cart</span> <i class='ri-shopping-bag-line'></i></button>
                                <a href='product.php?pi=$item[product_id]'>
                                    <button class='btn btn-dark'><span>Order Now</span> <i class='ri-shopping-cart-2-line'></i></button>
                                </a>
                            </div>
                        </div>";
                        }
                    ?>
                </div>
            </div>
        </section>

        <!-- Women's Fashion -->
        <section class="py-5 bg-gray">
            <div class="container">
                <div class="grid-container-2x">
                    <div class="title-align-left">
                        <h1>Women's Fashion</h1>
                        <p>Explore all the women's product</p>
                    </div>
                    <div class="btn-align-end">
                        <a href="#">
                            <button  onclick="window.location.href='category.php';" class="btn btn-dark btn-see-all">See All The Procuts <i class="ri-arrow-right-line"></i></button>
                        </a>
                    </div>
                </div>
                <br><hr><br>
                <div class="grid-container home-womens-fashion-products">
                    <!-- All Product Card Will Add Here Dynamically -->
                    <?php
                        $sql = "SELECT product_info.*, main_category.main_ctg_name 
                                FROM product_info 
                                JOIN main_category 
                                ON product_info.main_ctg_id = main_category.main_ctg_id";
                        $result = mysqli_query($conn, $sql);
                        
                        $products = array();
                        while ($item = mysqli_fetch_array($result)) {
                            echo "<div class='card' product-id='$item[product_id]' product-title='$item[product_title]' product-img='img/$item[product_img1]' product-price='$item[product_price]' product-quantity='1'>
                            <img onclick='window.location.href=\"product.php?pi=$item[product_id]\"' src='img/$item[product_img1]' class='card-img-top' alt='img'>
                            <div class='card-body'>
                                <h6 onclick='window.location.href=\"product.php?pi=$item[product_id]\"'>$item[product_title]</h6>
                                <p onclick='window.location.href=\"product.php?pi=$item[product_id]\"'>$item[main_ctg_name]</p>
                                <h6 onclick='window.location.href=\"product.php?pi=$item[product_id]\"'>Tk. $item[product_price]</h6>
                                <button onclick='addToCart(this)' class='btn btn-outline-dark'><span>Add to Cart</span> <i class='ri-shopping-bag-line'></i></button>
                                <a href='product.php?pi=$item[product_id]'>
                                    <button class='btn btn-dark'><span>Order Now</span> <i class='ri-shopping-cart-2-line'></i></button>
                                </a>
                            </div>
                        </div>";
                        }
                    ?>
                </div>
            </div>
        </section>
            
    </div>  
</div>
<!--==========================================-->
<!--============ END HOME SECTION ==========-->
<!--==========================================-->


<?php
// header file
include 'footer.php';
// cart bar
include 'bottomNavBar.php';
?>


<!-- Google Hosted Jquery --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!--JQuery Plugins-->
<script src="js/jquery.waypoints.min.js"></script>

<!-- Main JS -->
<script src="js/main.js"></script>
<script src="js/cartCalculation.js"></script>
<script src="js/search.js"></script>

<script>
// Sticky Navbar
$(document).ready(function () {
    $(".js-waypoint-sticky").waypoint(function (t) {
        "down" == t ? $("nav").addClass("sticky") : $("nav").removeClass("sticky");
    });
});
</script>

</body>
</html>
<?php
// Close the connection
mysqli_close($conn);
?>