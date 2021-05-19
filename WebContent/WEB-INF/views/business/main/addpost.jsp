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

<jsp:include page="../common/header.jsp"/>

  
<div class="container-fluid text-center">    
  <div class="row content">
      <form class="form-horizontal">
            <div class="col-sm-1 sidenav">
            </div>
            <div class="col-sm-10 text-left"> 
                <br><br><br>
                <h2 class="big">���� ���</h2>
                <br><br><br>
            </div>
             <div class="col-sm-0 sidenav">
            </div>
            <div class="form-group">
                <label class="col-sm-8" style="font-size: xx-large;">�λ� ����ڴ��� ������ �Է����ּ���.</label>
            </div>
            <hr>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">����� ����(�ʼ�)</label>
                <div class="col-sm-3">
                   <input type="email" class="form-control" id="inputEmail3" placeholder="����ڸ� �Է�">
                </div>
            </div>
             <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">��ȭ��ȣ(�ʼ�)</label>
                <div class="col-sm-1">
                  <input type="text" class="form-control" id="inputPassword3" placeholder="ex) 010">
                </div>
                <div class="col-sm-1">
                  <input type="text" class="form-control" id="inputPassword3" placeholder="1234">
                </div>
                <div class="col-sm-1">
                  <input type="text" class="form-control" id="inputPassword3" placeholder="1234">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">�̸��� �ּ�(�ʼ�)</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="inputPassword3" placeholder="�̸��� �ּ�">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">����</label>
                <div class="col-sm-6">
                  <textarea class="form-control" rows="2" style="resize: none;" placeholder="���Ͻô� ������ �߰��� �ּ���!"></textarea>
                </div>
                <div style="display: flex;">
                  <a href="#" class="btn">���� �߰��ϱ�</a>
                </div>
              </div>
              <label for="inputPassword3" class="col-sm-2 control-label">����</label>
              <div class="col-sm-1">                                    
                <div class="dropdown">
                  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">���� ����
                  <span class="caret"></span></button>
                  <ul class="dropdown-menu">
                    <li><a href="#">������</a></li>
                    <li><a href="#">�����</a></li>
                    <li><a href="#">���ϱ�</a></li>
                    <li><a href="#">���ϱ�</a></li>
                    <li><a href="#">�߶���</a></li>
                    <li><a href="#">����</a></li>
                    <li><a href="#">���α�</a></li>
                    <li><a href="#">���빮��</a></li>
                    <li><a href="#">������</a></li>
                    <li><a href="#">������</a></li>
                    <li><a href="#">���빮��</a></li>
                    <li><a href="#">������</a></li>
                    <li><a href="#">��걸</a></li>
                    <li><a href="#">������</a></li>
                    <li><a href="#">��õ��</a></li>
                    <li><a href="#">���α�</a></li>
                    <li><a href="#">��õ��</a></li>
                    <li><a href="#">��������</a></li>
                    <li><a href="#">���۱�</a></li>
                    <li><a href="#">���Ǳ�</a></li>
                    <li><a href="#">���ʱ�</a></li>
                    <li><a href="#">������</a></li>
                    <li><a href="#">���ı�</a></li>
                    <li><a href="#">������</a></li>
                  </ul>
              </div>  
            </div>
            <div class="col-sm-3">
              <input type="text" class="form-control" id="inputPassword3" placeholder="���ּҸ� �Է����ּ���.">
            </div>
            <div class="col-sm-0 sidenav">
            </div>
            <br><br><br><br><br>
            <div class="form-group">
                <label class="col-sm-8" style="font-size: xx-large;">�̶��� ����� ������ ã���ó���?</label>
            </div>
            <hr>
            <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">�����о߸�(�ʼ�)</label>
              <div class="col-sm-3">
                 <input type="email" class="form-control" id="inputEmail3" placeholder="����ڸ� �Է�">
              </div>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">��� �Ⱓ</label>
            <div class="col-sm-offset-2 col-sm-0">
              <div class="checkbox" style="width: 600px;">
                <label>
                  <input type="checkbox"> ���&nbsp;����
                </label>
                <label> 
                  <input type="checkbox"> 1��&nbsp;����
                </label>
                <label>
                  <input type="checkbox"> 1��&nbsp;�̻�
                </label>
                <label>
                  <input type="checkbox"> 2��&nbsp;�̻�
                </label>
                <label>
                  <input type="checkbox"> 3��&nbsp;�̻�
                </label>
                <label>
                  <input type="checkbox"> 4��&nbsp;�̻�
                </label>
                <label>
                  <input type="checkbox"> 5��&nbsp;�̻�
                </label>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">������</label>
            <div class="col-sm-3">
               <input type="email" class="form-control" id="inputEmail3" placeholder="�������� �����Ҽ��� �������� �������ϴ�.">
            </div>
        </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">�ʼ� / ��� ����</label>
            <div class="col-sm-3">
               <input type="email" class="form-control" id="inputEmail3" placeholder="��� ������ �����Ű���?">
            </div>
            <div style="display: flex;">
              <a href="#" class="btn">�����ϱ�</a>
            </div>
        </div>
        <div>
          <button style="width: 100px; height: 50px;"class="btn btn-warning"><a href="WEB-INF/views/business/main/addpost2.jsp">����</a></button>
        </div>
      </div>
    </div>
  </form>
    <br><br>
    <br><br>

	<jsp:include page="../common/footer.jsp"/>


</body>
</html>
