<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
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
        .lectureRoom{
           margin-left: 50px;
           padding: 10px;
           border-spacing: 8px;
        }
        
    </style>
</head>
<script type="text/javascript" src="selectTime.js"></script>
<body>
    <div>             
        <div class="outer">     
            <div>
                <div>
                    
                    
                    <section>
                        <label for="start">Start date:</label>

                        <input type="date" id="start" name="trip-start"
                               value="2022-05-13"
                               min="2022-05-13" max="2030-12-31">


                        <select name="reservationTimeStart" onchange="categoryChange(this)">
                            <option>시작 시간 선택</option>
                            <option value="1">09:00</option>
                            <option value="2">10:00</option>
                            <option value="3">11:00</option>
                            <option value="4">12:00</option>
                            <option value="5">13:00</option>
                            <option value="6">14:00</option>
                            <option value="7">15:00</option>
                            <option value="8">17:00</option>
                            <option value="9">18:00</option>
                            <option value="10">19:00</option>
                            <option value="11">20:00</option>
                        </select>

                        <select name="reservationTimeEnd" id="endTime">
                            
                            <option value="">종료 시간 선택</option>
                            <option value="">10:00</option>
                            <option value="">11:00</option>
                            <option value="">12:00</option>
                            <option value="">13:00</option>
                            <option value="">14:00</option>
                            <option value="">15:00</option>
                            <option value="야간">17:00</option>
                            <option value="야간">18:00</option>
                            <option value="야간">19:00</option>
                            <option value="야간">20:00</option>
                            <option value="야간">21:00</option>
                        </select> 

                        <form name="input" method="post" action="seatSelection.html">
                            <input type="submit" value="선택">
                        </form>
                               
                    </section>
                    
                </div>    
            </div>
        </div>  
    </div>
</body>
</html>