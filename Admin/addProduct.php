<?php
error_reporting(0);
session_start();
if (!isset($_SESSION['admin'])) {
    header("Location: login.php");
    exit();
}

include('database/dbConnection.php'); // Include database connection file

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $product_title = $_POST['product_title'];
  $product_price = $_POST['product_price'];
  $product_main_ctg_name = $_POST['product_main_ctg_name'];
  $product_sub_ctg_name = $_POST['product_sub_ctg_name'];
  $available_stock = $_POST['available_stock'];
  $size_option = "Default";
  $product_keyword = $_POST['product_keyword'];
  $product_description = $_POST['product_description'];

  // Image 1
  $file_name = $_FILES['product_img1']['name'];
  $tempname = $_FILES['product_img1']['tmp_name'];
  $folder = '../img/'.$file_name;

  // Image 2
  $file_name2 = $_FILES['product_img2']['name'];
  $tempname2 = $_FILES['product_img2']['tmp_name'];
  $folder2 = '../img/'.$file_name2;

  // Image 3
  $file_name3 = $_FILES['product_img3']['name'];
  $tempname3 = $_FILES['product_img3']['tmp_name'];
  $folder3 = '../img/'.$file_name3;

  // Image 4
  $file_name4 = $_FILES['product_img4']['name'];
  $tempname4 = $_FILES['product_img4']['tmp_name'];
  $folder4 = '../img/'.$file_name4;

  // Move the uploaded files to the desired folder
  $uploadSuccess = true;
  if (!empty($file_name) && !move_uploaded_file($tempname, $folder)) {
      $uploadSuccess = false;
  }
  if (!empty($file_name2) && !move_uploaded_file($tempname2, $folder2)) {
      $uploadSuccess = false;
  }
  if (!empty($file_name3) && !move_uploaded_file($tempname3, $folder3)) {
      $uploadSuccess = false;
  }
  if (!empty($file_name4) && !move_uploaded_file($tempname4, $folder4)) {
      $uploadSuccess = false;
  }

  if ($uploadSuccess) {
      // Prepare the SQL query
      $query = "INSERT INTO product_info (product_title, product_price, main_ctg_name, sub_ctg_name, available_stock, size_option, product_keyword, product_description, product_img1, product_img2, product_img3, product_img4) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      
      $stmt = $conn->prepare($query);
      $stmt->bind_param("sdssisssssss", $product_title, $product_price, $product_main_ctg_name, $product_sub_ctg_name, $available_stock, $size_option, $product_keyword, $product_description, $file_name, $file_name2, $file_name3, $file_name4);

      // Execute the query
      if ($stmt->execute()) {
        $product_added_status = "Product Added Successful!";
      } else {
          echo "Error: " . $stmt->error;
      }

  } else {
      echo "Failed to upload one or more images.";
  }
}
?>
<!DOCTYPE html>
<html lang="en">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin</title>

    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/ti-icons/css/themify-icons.css">
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.png" />

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/thinline.css">

    <!-- Custom CSS-->
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="css/style.css">

    <style>
      #success-box {
        max-width: 800px;
        margin: auto;
        text-align: center;
        font-size: 18px;
        padding: 20px;
        color: #0A3622;
        background: #D1E7DD;
      }
    </style>

  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:partials/_navbar.php -->
      <?php include('navbar.php'); ?>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        
        <!-- partial:partials/_sidebar.php -->
        <?php include('sidebar.php'); ?>
        <div class="main-panel">


          <!--------------------------->
          <!-- START ADD PRODUCT AREA -->
          <!--------------------------->
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">
                <span class="page-title-icon bg-gradient-primary text-white me-2">
                  <i class="mdi mdi-home"></i>
                </span> Product
              </h3>
            </div>
            <br>
            <?php
            if (isset($product_added_status)) {
              echo '<div id="success-box">'.$product_added_status.'</div>';
            }
            ?>
            <div class="row">
              <div class="form-container">
                <h1 class="text-center">Add Product</h1>
                <div class="content">
                    <!-- Product Add form -->
                    <form action="" method="post" enctype="multipart/form-data">
                      <div class="user-details full-input-box">
                        <!-- title -->
                        <div class="input-box">
                          <span class="details">Product Title *</span>
                          <input name="product_title" type="text" placeholder="Enter your product title" required>
                        </div>
                        <!-- price -->
                        <div class="input-box">
                          <span class="details">Price *</span>
                          <input name="product_price" type="text" placeholder="Enter your product price" required>
                        </div>
                        <!-- Main Category -->
                        <div class="input-box">
                          <span class="details">Choose Main Category *</span>
                          <select id="main_ctg_name" name="product_main_ctg_name" required>
                            <option value="">Select Main Category</option>
                            <?php
                              // Fetch main categories from the database
                              $result = mysqli_query($conn, "SELECT main_ctg_name FROM main_category");
                              while ($row = mysqli_fetch_assoc($result)) {
                                $category_name = htmlspecialchars($row['main_ctg_name'], ENT_QUOTES, 'UTF-8');
                                  echo "<option value='$category_name'>$category_name</option>";
                              }
                            ?>
                          </select>
                        </div>
                        <!-- Sub Category -->
                        <div class="input-box">
                          <span class="details">Choose Sub Category *</span>
                          <select id="main_sub_name" name="product_sub_ctg_name" required>
                            <option value="">Select Sub Category</option>
                            <?php
                              // Fetch main categories from the database
                              $result = mysqli_query($conn, "SELECT sub_ctg_name FROM sub_category");
                              while ($row = mysqli_fetch_assoc($result)) {
                                $category_name = htmlspecialchars($row['sub_ctg_name'], ENT_QUOTES, 'UTF-8');
                                  echo "<option value='$category_name'>$category_name</option>";
                              }
                            ?>
                          </select>
                        </div>
                        <!-- Total Stock -->
                        <div class="input-box">
                          <span class="details">Total Stock Amount *</span>
                          <input name="available_stock" type="text" placeholder="Enter your total stock amount" required>
                        </div>
                        <!-- keyword -->
                        <div class="input-box">
                          <span class="details">Product Keyword *</span>
                          <input name="product_keyword" type="text" placeholder="Enter your product keyword" required>
                        </div>
                        <!-- Description -->
                        <div class="input-box">
                          <span class="details">Description *</span>
                          <input name="product_description" type="text" placeholder="Enter your product description" required>
                        </div>
                        <!-- Size -->
                        <!-- <span class="details">Product Available Size</span>
                        <div class="input-checkbox">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="S" id="flexCheckDefault">
                            <label class="form-check-label" for="flexCheckDefault">
                              S
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="M" id="flexCheckChecked">
                            <label class="form-check-label" for="flexCheckChecked">
                              M
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="L" id="flexCheckChecked">
                            <label class="form-check-label" for="flexCheckChecked">
                              L
                            </label>
                            <div class="form-check">
                              <input class="form-check-input" type="checkbox" value="XL" id="flexCheckChecked">
                              <label class="form-check-label" for="flexCheckChecked">
                                XL
                              </label>
                            </div>
                            <div class="form-check">
                              <input class="form-check-input" type="checkbox" value="XXL" id="flexCheckChecked">
                              <label class="form-check-label" for="flexCheckChecked">
                                XXL
                              </label>
                            </div>
                          </div>
                        </div> -->
                        <!-- main image -->
                        <div>
                          <span class="details">Attach Primary Image *</span>
                          <h4>(800 X 800)</h4>
                          <input type="file" name="product_img1" id="file" class="inputfile" required/><br>
                        </div>
                        <!-- image 2 -->
                        <div>
                          <span class="details">Attach Image 2</span>
                          <h4>(800 X 800)</h4>
                          <input type="file" name="product_img2" id="file" class="inputfile"/><br>
                        </div>
                        <!-- image 3 -->
                        <div>
                          <span class="details">Attach Image 3</span>
                          <h4>(800 X 800)</h4>
                          <input type="file" name="product_img3" id="file" class="inputfile"/><br>
                        </div>
                        <!-- image 4 -->
                        <div>
                          <span class="details">Attach Image 4</span>
                          <h4>(800 X 800)</h4>
                          <input type="file" name="product_img4" id="file" class="inputfile"/><br>
                        </div>
                      </div>
                      <!-- Submit button -->
                      <div class="button">
                        <input type="submit" value="Add Product">
                      </div>
                    </form>
                    
                </div>
              </div>
            </div>
          </div>
          <!--------------------------->
          <!-- END ADD PRODUCT AREA -->
          <!--------------------------->
          

          <!-- partial:partials/_footer.php -->
          <?php include('footer.php'); ?>
        </div>
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->

    <!-- JS FILES  -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/misc.js"></script>

  </body>
</html>