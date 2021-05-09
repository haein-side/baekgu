<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background: darkslategrey;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      /* background-color: #f1f1f1; */
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">�鱸</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="home.html">Ȩ</a></li>
        <li><a href="addad.html">������</a></li>
        <li><a href="#">�����ڰ���</a></li>
        <li><a href="#">�������</a></li>
        <li><a href="payment.html">��������</a></li>
        <li><a href="ad.html">��ǰ�ȳ�</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">ȸ���</a></li>
        <li><a href="#">����ڸ�</a></li>
        <li><a href="#">�α׾ƿ�</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-3 sidenav">
    </div>
    <div class="col-sm-6 text-left">
        <div> 
        <br><br><br>
        <h1> <img src="../resources/images/cat.jpg" style="width :200px; height: 200px; ">��� �̸��� �� ���Դϴ�<div class=""></div></h1>
        <ul style="padding-left: 25px;">
          <li style="font-size: 15px;">�鱸�鱸�鱸�鱸�鱸�鱸�鱸�鱸�鱸�鱸�鱸�鱸�鱸�鱸�鱸�鱸�鱸�鱸.</li>
          <li><p style="color: red; font-size: 15px;"><b>[����]</b> ���� ��ǰ�� �̿� ���̽� ���, ���� ���� �����ϴ��� ���� �Ⱓ�� ���� ������ ȯ�ҵ��� �ʽ��ϴ�.</p></li>
          </ul>
          <br><br><br><br>
       </div>
       <div>
        <div style="background-color: orange; width: 600px; height: 600px;  float: left;">
          <div style="width: 40%; height: 100%; background-color: orange; float: left;" align="center">
            <br><br><br><br><br><br><br>
            <h3>������ ����</h3>
            <span style="font-size: xx-large;">n</span><label>��</label><br>
            <button>��ü����</button>
          </div>
          <div style="width: 40%; height: 100%; background-color: orange; float: left;" align="CENTER">
            <br><br><br><br><br><br><br><br>
            <h4>���� ����</h4>
            <h4>���� ����</h4>
          </div>
        </div>
        <div style="background-color: orange; width: 200px; height: 600px;  float: left; border: 1px solid black;">
          <div style="background-color: orange; width: 100%; height: 25%; border: 1px solid black; " align="center">
            <h3> ���� ���</h3>
            <P> ���� ����� ���ϴ� ������� ����������!</P>
            <button>���⸦ ������</button>
          </div>
          <div style="background-color: orange; width: 100%; height: 25%; border: 1px solid black;"  align="center">
            <h3>������ ����</h3>
            <p> ����� ����� ���ϴ� ������� ����������!</p>
            <button>���⸦ ������</button>
          </div>
          <div style="background-color: orange; width: 100%; height: 25%; border: 1px solid black;"  align="center">
            <h3>���� ����</h3>
            <p>��� �Ͻ� ���� �Ѵ��� ������!</p>
            <button>���⸦ ������</button>
          </div>
          <div style="background-color: orange; width: 100%; height: 25%; border: 1px solid black;"  align="center">
            <h3>���� ����</h3>
            <p>���� �ָ� �� �� �ٸ����!</p>
            <button>���⸦ ������</button>
          </div>

        </div>
       </div>
    </div>
    <div class="col-sm-3 sidenav">
    </div>
  </div>
</div>
<br><br><br>
      <div class="col-sm-1 sidenav">
      </div>
    </div>
  </div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
