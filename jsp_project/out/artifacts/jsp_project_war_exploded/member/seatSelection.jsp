<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .menu{
            display: inline-block;
            padding: 10px;
            margin: 10px;
        }
        section {
            background-color: white;
            width: 500px;
            height: 500px;
            text-align: center;
            margin: 45px;
        }
        .outer{
            background-color: gray;
            display: inline-block;
            width: 600px;
            height: 600px;
            padding: 10px;
            
        }
        .file{
            text-align: right;
            margin: 5px;
        }
        .seat{
           margin-left: 50px;
           padding: 10px;
           border-spacing: 8px;
           border: 10px;
           align-items: center;
        }
        td,tr{
            border: 1px solid aqua;
            align-items: center;
            padding: 1px;
            background-color: aqua;
        }
    </style>
</head>
<body>
    <div>            
        <div class="menu">              
            <div>
                <div>      
                    <p>
                        공지사항
                    </p>
                </div>                  
                <div>  
                    <p>
                        사용방법
                    </p>
                </div>  
                <div >  
                    <p>
                        예약하기
                    </p>
                </div>    
                <div >                          
                    <p>
                        예약확인
                    </p>
                </div>        
            
                <div>                          
                    <p>
                        강의실 조회
                    </p>
                </div>      
                <div>                          
                    <p>
                        FAQ
                    </p>
                </div>          
            </div>
        </div>          
         
        <div class="outer">     
            <div>
                <div>
                    
                    <select name="lectureRoomSelection">
                        <option value="">강의실 선택</option>
                        <option value="915">915</option>
                        <option value="916">916</option>
                        <option value="918">918</option>
                        <option value="911">911</option>

                        <form name="input" method="post" action="seatSelection.html">
                            <input type="submit" value="선택">
                        </form>
                    </select>

                    <section>
                        <h1>Screen</h1>
                        <br>
                        <input type="checkbox" name="seat" value="1">
                        <input type="checkbox" name="seat" value="2">
                        <input type="checkbox" name="seat" value="3">
                        <input type="checkbox" name="seat" value="4">
                        <input type="checkbox" name="seat" value="5">
                        <input type="checkbox" name="seat" value="6">
                        <input type="checkbox" name="seat" value="7">
                        <input type="checkbox" name="seat" value="8">
                        <br>
                        <input type="checkbox" name="seat" value="9">
                        <input type="checkbox" name="seat" value="10">
                        <input type="checkbox" name="seat" value="11">
                        <input type="checkbox" name="seat" value="12">
                        <input type="checkbox" name="seat" value="13">
                        <input type="checkbox" name="seat" value="14">
                        <input type="checkbox" name="seat" value="15">
                        <input type="checkbox" name="seat" value="16">
                        <br>
                        
                        <form name="input" method="post" action="">
                            <input type="submit" value="예약">
                        </form>



                        <!-- <table class="seat">
                            <tr>
                                <td>자리1</td>
                                <td>자리2</td>
                                <td>자리3</td>
                                <td>자리4</td>
                            </tr>
                            
                            <tr>
                                <td>자리5</td>
                                <td>자리6</td>
                                <td>자리7</td>
                                <td>자리8</td>
                            </tr>

                            <tr>
                                <td>자리9</td>
                                <td>자리10</td>
                                <td>자리11</td>
                                <td>자리12</td>
                            </tr>

                            <tr>
                                <td>자리13</td>
                                <td>자리14</td>
                                <td>자리15</td>
                                <td>자리16</td>>
                            </tr>
                        </table> -->

                    </section>
                    
                </div>    
            </div>
        </div>  
    </div>
</body>
</html>