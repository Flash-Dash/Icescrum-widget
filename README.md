# Icescrum-widget
Widget to extract data from Icescrum and input it into a widget

The sprint progress is calculated via the velocity/capacity. These figures are also shown just under the meter.

To be added to .erb

  <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
      <div data-id="ice_scrum" data-view="Icescrum" data-suffix="%"  data-title="Sprint Progress" data-min="0" data-max="100"></div>
    <i class="icon-signal icon-background"></i>
  </li>

Preview:

![2016-02-17_1729](https://cloud.githubusercontent.com/assets/17084462/13145226/4783704e-d61d-11e5-9d56-5a74e0fdf2ae.png)



You will need to change the sample words with your own information. Such as:
- filename.xml
- username
- password
- url.ca:8080/icescrum/
- result.sml
