<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 07/04/2024
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.syndic.beans.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="./css/Homestyle.css">
    <title>Home</title>
</head>
<body>
<jsp:include page="templates/side_nav.jsp" />

<div class="all">
  <div class="content">
    <div class="greeting">
      <h3 class="font-weight-bold" style="margin-left: 90%">Welcome <%= ((User) session.getAttribute("user")).getName() %>!</h3>

    </div>

    <main>
      <div class="grid-area-1">
        <div class="distance">
          <section class="distance__section distance__cycling">
            <p>42 km</p>
            <h2>Cycling</h2>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="currentColor" d="M11 15.414V20h2v-4.586c0-.526-.214-1.042-.586-1.414l-2-2L13 9.414l2 2c.372.372.888.586 1.414.586H20v-2h-3.586l-3.707-3.707a.999.999 0 0 0-1.414 0L8 9.586c-.378.378-.586.88-.586 1.414s.208 1.036.586 1.414l3 3z"/><circle cx="16" cy="5" r="2" fill="currentColor"/><path fill="currentColor" d="M18 14c-2.206 0-4 1.794-4 4s1.794 4 4 4s4-1.794 4-4s-1.794-4-4-4zm0 6c-1.103 0-2-.897-2-2s.897-2 2-2s2 .897 2 2s-.897 2-2 2zM6 22c2.206 0 4-1.794 4-4s-1.794-4-4-4s-4 1.794-4 4s1.794 4 4 4zm0-6c1.103 0 2 .897 2 2s-.897 2-2 2s-2-.897-2-2s.897-2 2-2z"/></svg>
          </section>
          <section class="distance__section distance__running">
            <p>22 km</p>
            <h2>Running</h2>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 416 512"><path fill="currentColor" d="M272 96c26.51 0 48-21.49 48-48S298.51 0 272 0s-48 21.49-48 48s21.49 48 48 48zM113.69 317.47l-14.8 34.52H32c-17.67 0-32 14.33-32 32s14.33 32 32 32h77.45c19.25 0 36.58-11.44 44.11-29.09l8.79-20.52l-10.67-6.3c-17.32-10.23-30.06-25.37-37.99-42.61zM384 223.99h-44.03l-26.06-53.25c-12.5-25.55-35.45-44.23-61.78-50.94l-71.08-21.14c-28.3-6.8-57.77-.55-80.84 17.14l-39.67 30.41c-14.03 10.75-16.69 30.83-5.92 44.86s30.84 16.66 44.86 5.92l39.69-30.41c7.67-5.89 17.44-8 25.27-6.14l14.7 4.37l-37.46 87.39c-12.62 29.48-1.31 64.01 26.3 80.31l84.98 50.17l-27.47 87.73c-5.28 16.86 4.11 34.81 20.97 40.09c3.19 1 6.41 1.48 9.58 1.48c13.61 0 26.23-8.77 30.52-22.45l31.64-101.06c5.91-20.77-2.89-43.08-21.64-54.39l-61.24-36.14l31.31-78.28l20.27 41.43c8 16.34 24.92 26.89 43.11 26.89H384c17.67 0 32-14.33 32-32s-14.33-31.99-32-31.99z"/></svg>
          </section>
          <section class="distance__section distance__swimming">
            <p>10 km</p>
            <h2>Swimming</h2>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50"><path fill="currentColor" d="M49 40a7.125 7.125 0 0 1-2.952-.641a7.416 7.416 0 0 0-3.042-.664a7.467 7.467 0 0 0-3.049.664a7.123 7.123 0 0 1-5.903 0a7.545 7.545 0 0 0-3.048-.664a7.492 7.492 0 0 0-3.049.664a7.147 7.147 0 0 1-5.913 0a7.43 7.43 0 0 0-3.036-.664a7.487 7.487 0 0 0-3.048.664a7.141 7.141 0 0 1-5.912 0A7.458 7.458 0 0 0 7 38.695a7.472 7.472 0 0 0-3.037.664A7.204 7.204 0 0 1 1 40v-4.396a7.47 7.47 0 0 0 2.963-.631A7.287 7.287 0 0 1 7 34.299c1.086 0 2.127.25 3.048.674a7.398 7.398 0 0 0 2.948.631a7.42 7.42 0 0 0 2.964-.631a7.3 7.3 0 0 1 3.048-.674c1.078 0 2.114.25 3.036.674a7.44 7.44 0 0 0 2.96.631a7.407 7.407 0 0 0 2.953-.631a7.308 7.308 0 0 1 3.049-.674c1.073 0 2.113.25 3.048.674c.895.393 1.9.631 2.95.631a7.377 7.377 0 0 0 2.953-.631a7.283 7.283 0 0 1 3.049-.674c1.086 0 2.125.25 3.042.674a7.38 7.38 0 0 0 2.952.631V40zm-6.952-12.436c3.152 0 5.71-2.55 5.71-5.678c0-3.131-2.558-5.668-5.71-5.668c-3.157 0-5.712 2.538-5.712 5.668c0 3.128 2.328 5.678 5.712 5.678zM8.791 30.756c.443.105.861.258 1.258.436a7.255 7.255 0 0 0 2.949.641c1.05 0 2.069-.238 2.963-.641a7.463 7.463 0 0 1 3.048-.676c1.078 0 2.116.262 3.036.676a7.293 7.293 0 0 0 2.96.641c1.04 0 2.058-.238 2.952-.641a7.47 7.47 0 0 1 3.049-.676c1.074 0 2.115.262 3.048.676c.896.402 1.9.641 2.952.641c.765 0 1.502-.129 2.197-.346l-9.525-17.056l11.079-2.007c1.626-.308 2.806-1.576 2.806-3.199c0-1.79-1.467-3.225-3.262-3.225l-.37.011l-17.114 3.092c-1.201.273-2.792 2.019-1.886 4.161l.146.345l4.466 8.003l-16.752 9.144z"/></svg>
          </section>
        </div>

        <section class="weekly">
          <h2>Weekly Schedule</h2>
          <table cellspacing="0" cellpadding="0">
            <tr>
              <th>Day</th>
              <th>Exercise</th>
              <th>Time</th>
            </tr>
            <tr>
              <td>Monday</td>
              <td>Running</td>
              <td>6:00 AM</td>
            </tr>
            <tr>
              <td>Tuesday</td>
              <td>Swimming</td>
              <td>7:00 AM</td>
            </tr>
            <tr>
              <td>Wednesday</td>
              <td>Cycling</td>
              <td>6:30 AM</td>
            </tr>
            <tr>
              <td>Thursday</td>
              <td>Yoga</td>
              <td>6:00 AM</td>
            </tr>
            <tr>
              <td>Friday</td>
              <td>Weight-Training</td>
              <td>8:00 AM</td>
            </tr>
          </table>
        </section>




      <div class="grid-area-2">
        <section class="friend-acitvity">
          <h2>Friends Activities</h2>
          <div class="friend-activity__activity">
            <div class="friend-acitvity__picture"><div></div></div>
            <div>
              <h3 class="friend-activity__name">Jane</h3>
              <p class="friend-activity__msg">just set a new record in cycling: 30 km!</p>
            </div>
          </div>
          <div class="friend-activity__activity">
            <div class="friend-acitvity__picture"><div></div></div>
            <div>
              <h3 class="friend-activity__name">Mike</h3>
              <p class="friend-activity__msg">completed the 30-Day Running Streak Challenge!</p>
            </div>
          </div>
          <div class="friend-activity__activity">
            <div class="friend-acitvity__picture"><div></div></div>
            <div>
              <h3 class="friend-activity__name">Anna</h3>
              <p class="friend-activity__msg">shared a new workout: 'Hill Sprints Interval'!</p>
            </div>
          </div>
          <div class="friend-activity__activity">
            <div class="friend-acitvity__picture"><div></div></div>
            <div>
              <h3 class="friend-activity__name">John</h3>
              <p class="friend-activity__msg">just set a new record in running: 18 km!</p>
            </div>
          </div>
          <div class="friend-activity__activity">
            <div class="friend-acitvity__picture"><div></div></div>
            <div>
              <h3 class="friend-activity__name">Mila</h3>
              <p class="friend-activity__msg">completed the 30-Day Running Streak Challenge!</p>
            </div>
          </div>
          <div class="friend-activity__activity">
            <div class="friend-acitvity__picture"><div></div></div>
            <div>
              <h3 class="friend-activity__name">John</h3>
              <p class="friend-activity__msg">completed the 30-Day Running Streak Challenge!</p>
            </div>
          </div>
          <div class="friend-activity__activity">
            <div class="friend-acitvity__picture"><div></div></div>
            <div>
              <h3 class="friend-activity__name">Anna</h3>
              <p class="friend-activity__msg">just set a new record in running: 14 km!</p>
            </div>

          </div>
          <a href="#">See all &rarr;</a>
        </section>

        <section class="friends">
          <h2>Friends</h2>
          <div class="friends__friend">
            <div class="friends__picture"><div></div></div>
            <h3 class="friends__name">Jane</h3>
            <p class="friends__msg">last seen 5 min ago</p>
          </div>
          <div class="friends__friend">
            <div class="friends__picture"><div></div></div>
            <h3 class="friends__name">Mike</h3>
            <p class="friends__msg">last seen 6 hrs ago</p>
          </div>
          <div class="friends__friend">
            <div class="friends__picture"><div></div></div>
            <h3 class="friends__name">Anna</h3>
            <p class="friends__msg">last seen 7 hrs ago</p>
          </div>
          <div class="friends__friend">
            <div class="friends__picture"><div></div></div>
            <h3 class="friends__name">John</h3>
            <p class="friends__msg">last seen 2 days ago</p>
          </div>
          <div class="friends__friend">
            <div class="friends__picture"><div></div></div>
            <h3 class="friends__name">Mila</h3>
            <p class="friends__msg">last seen 3 weeks ago</p>
          </div>
          <div class="friends__friend">
            <div class="friends__picture"><div></div></div>
            <h3 class="friends__name">Ben</h3>
            <p class="friends__msg">last seen 1 year ago</p>
          </div>
        </section>
      </div>

      <div class="grid-area-3">
        <section class="challenges">
          <h2>Challenges</h2>
          <div class="challenges__bar challenges__bar--1"></div>
          <p class="challenges__text">30-Day Running Streak</p>
          <div class="challenges__bar challenges__bar--2"></div>
          <p class="challenges__text">30-Day Running Streak</p>
          <div class="challenges__bar challenges__bar--3"></div>
          <p class="challenges__text">30-Day Running Streak</p>
        </section>

        <section class="last-week">
          <h2>Activities compared to last week</h2>
          <div class="last-week__chart">
            <div class="last-week__bar last-week__bar--1"><p>20min</p></div>
            <div class="last-week__bar last-week__bar--2"><p>25min</p></div>
            <div class="last-week__bar last-week__bar--3"><p>18min</p></div>
            <div class="last-week__bar last-week__bar--4"><p>15min</p></div>
            <div class="last-week__bar last-week__bar--5"><p>10min</p></div>
            <div class="last-week__bar last-week__bar--6"><p>19min</p></div>
          </div>
          <div class="last-week__labels">
            <p>Running</p>
            <p>Swimming</p>
            <p>Cycling</p>
          </div>
          <a href="#">See all stats &rarr;</a>
        </section>

        <div class="personal-bests">
          <section class="personal-bests__best personal-bests__best--run">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="currentColor" d="M21 4h-3V3a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1v1H3a1 1 0 0 0-1 1v3c0 4.31 1.8 6.91 4.82 7A6 6 0 0 0 11 17.91V20H9v2h6v-2h-2v-2.09A6 6 0 0 0 17.18 15c3-.1 4.82-2.7 4.82-7V5a1 1 0 0 0-1-1zM4 8V6h2v6.83C4.22 12.08 4 9.3 4 8zm14 4.83V6h2v2c0 1.3-.22 4.08-2 4.83z"/></svg>
            <h2>Fastest 5K Run</h2>
            <p>22 min</p>
          </section>
          <section class="personal-bests__best personal-bests__best--lift">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="currentColor" d="M21 4h-3V3a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1v1H3a1 1 0 0 0-1 1v3c0 4.31 1.8 6.91 4.82 7A6 6 0 0 0 11 17.91V20H9v2h6v-2h-2v-2.09A6 6 0 0 0 17.18 15c3-.1 4.82-2.7 4.82-7V5a1 1 0 0 0-1-1zM4 8V6h2v6.83C4.22 12.08 4 9.3 4 8zm14 4.83V6h2v2c0 1.3-.22 4.08-2 4.83z"/></svg>
            <h2>Haviest Deadlift</h2>
            <p>250 lbs</p>
          </section>
          <section class="personal-bests__best personal-bests__best--plank">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="currentColor" d="M21 4h-3V3a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1v1H3a1 1 0 0 0-1 1v3c0 4.31 1.8 6.91 4.82 7A6 6 0 0 0 11 17.91V20H9v2h6v-2h-2v-2.09A6 6 0 0 0 17.18 15c3-.1 4.82-2.7 4.82-7V5a1 1 0 0 0-1-1zM4 8V6h2v6.83C4.22 12.08 4 9.3 4 8zm14 4.83V6h2v2c0 1.3-.22 4.08-2 4.83z"/></svg>
            <h2>Longest plank</h2>
            <p>3 min</p>
          </section>
        </div>
      </div>
    </main>
  </div>
</div>

</body>
</html>
