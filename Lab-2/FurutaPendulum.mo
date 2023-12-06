model FurutaPendulum "Furuta pendulum"
    
    parameter Real pendulumA_start = - Modelica.Constants.pi;
    parameter Real pendulumB_start = - Modelica.Constants.pi;
    
    model ControllerLQR
      Modelica.Blocks.Interfaces.RealInput phi, dphi, theta1, dtheta1, theta2, dtheta2;
      Modelica.Blocks.Interfaces.RealOutput u(start=0);
      Real x[6];
      Real L[6] = {100., 9.65721819, 103.07438354, -1.40000991, 87.40106372, -3.88918398}; //Original
      //Real L[6] = {10., 0.96689431, 10.30930564, -0.13879217,  8.76239305, -0.38789182}; //Higher R
    equation
      x = {phi+3.14/2, dphi, theta1+3.14, dtheta1, theta2+3.14, dtheta2};
      u = -L*x;
    end ControllerLQR;
    
    ControllerLQR c(
        phi = rotorA.phi, //rotor
        dphi = rotorW.w,   //rotor
        theta1 = pendulumA.phi, //pendulum
        dtheta1 = pendulumW.w,//pendulum
        theta2 = smallAngleSensor.phi, //small pendulum
        dtheta2 = smallSpeedSensor.w, //small pendulum
        u = torque.tau
    );
    
    inner Modelica.Mechanics.MultiBody.World world(
      axisLength(displayUnit="mm"),
      axisDiameter(displayUnit="mm"),
      nominalLength(displayUnit="mm") = 0.1)
                                annotation (Placement(transformation(extent={{-60,-60},
              {-39,-40}},   rotation=0)));
    Modelica.Mechanics.MultiBody.Joints.Revolute rotor(
      a(fixed=false),
      w(fixed=true),
      cylinderLength(displayUnit="mm") = 0.015,
      cylinderColor={0,0,0},
      cylinderDiameter(displayUnit="mm") = 0.0605,
      useAxisFlange=true,
      n={0,1,0},
      phi(fixed=true, start=-1.5707963267949)) annotation (Placement(
          transformation(
          origin={0,32},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica.Mechanics.MultiBody.Joints.Revolute pendulumAxis(
      a(fixed=false),
      w(fixed=true),
      cylinderLength(displayUnit="mm") = 0.005,
      cylinderDiameter(displayUnit="mm") = 0.005,
      cylinderColor={200,200,200},
      useAxisFlange=true,
      n={-1,0,0},
      phi(
        fixed=true,
        start=pendulumA_start,
        displayUnit="rad")) annotation (Placement(transformation(extent={{38,56},
              {58,76}}, rotation=0)));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder base(
      r(displayUnit="mm") = {0,0.1,0},
      r_shape(displayUnit="mm") = {0,0,0},
      diameter(displayUnit="mm") = 0.06,
      color={155,155,155},
      r_0(displayUnit="mm", fixed=true)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-26})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder pendulumArm(
      r_shape(displayUnit="mm") = {0,0,0},
      diameter(displayUnit="mm") = 0.005,
      color={200,200,200},
      r(displayUnit="mm") = {0,0.075,0},
      density=3700) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={70,2})));
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed(
      length=0,
      width=0,
      height=0,
      r(displayUnit="mm") = {0,-0.025,-0.1})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-52})));
    Modelica.Mechanics.Rotational.Components.Damper pendulumDamper(d=0.000005)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={48,86})));
    Modelica.Mechanics.Rotational.Components.Damper rotorDamper(d=0.05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-24,42})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder pendulumAttachment(
      r_shape(displayUnit="mm") = {0,0,0},
      diameter(displayUnit="mm") = 0.005,
      color={155,155,155},
      r(displayUnit="mm") = {0.043,0,0},
      density=3700) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={14,66})));

    Modelica.Mechanics.Rotational.Sensors.AngleSensor pendulumA
      annotation (Placement(transformation(extent={{78,64},{92,78}})));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor pendulumW
      annotation (Placement(transformation(extent={{79.0,81.0},{93.0,95.0}},rotation = 0.0,origin = {0.0,0.0})));
    Modelica.Mechanics.Rotational.Sensors.AngleSensor rotorA
      annotation (Placement(transformation(extent={{-20,-12},{-6,2}})));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor rotorW
      annotation (Placement(transformation(extent={{-20,2},{-6,16}})));
    Modelica.Blocks.Sources.Pulse pulse[3](
      startTime={1,1,1},
      width={1,1,1},
      period={10,10,10},
      amplitude={0.005,0,0})   annotation (Placement(transformation(
          extent={{26.0,-38.0},{38.0,-26.0}},
          rotation=0.0,
          origin={0.0,0.0})));
    Modelica.Mechanics.MultiBody.Forces.WorldForce disturbance
      annotation (Placement(transformation(extent={{50,-40},{66,-24}})));
    .Modelica.Mechanics.MultiBody.Parts.BodyCylinder smallPendulumAttachment(r_shape = {0,0,0},r = {-0.043,0,0},density = 3700,color = {255,0,0},diameter = 0.005) annotation(Placement(transformation(extent = {{116.0,2.0},{136.0,22.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.MultiBody.Parts.BodyCylinder smallPendulumArm(r_shape = {0,0,0},r = {0,0.03,0},density = 3700,color = {0,180,0},diameter = 0.005) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {184.0,-22.0},rotation = -90.0)));
    .Modelica.Mechanics.MultiBody.Joints.Revolute smallRevolute(useAxisFlange = true,n = {-1,0,0},phi(start = pendulumB_start,fixed = true)) annotation(Placement(transformation(extent = {{156,2},{176,22}},origin = {0,0},rotation = 0)));
    .Modelica.Mechanics.Rotational.Components.Damper smallDamper(d = pendulumDamper.d / 2) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {166.0,40.0},rotation = -180.0)));
    .Modelica.Mechanics.Rotational.Sensors.AngleSensor smallAngleSensor annotation(Placement(transformation(extent = {{196.0,17.0},{216.0,37.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.Rotational.Sensors.SpeedSensor smallSpeedSensor annotation(Placement(transformation(extent = {{196.0,-9.0},{216.0,11.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.MultiBody.Forces.WorldForce force annotation(Placement(transformation(extent = {{152,-52},{172,-32}},origin = {0,0},rotation = 0)));
    .Modelica.Mechanics.Rotational.Sources.Torque torque(useSupport = false) annotation(Placement(transformation(extent = {{-30.0,62.0},{-10.0,82.0}},origin = {0.0,0.0},rotation = 0.0)));
    equation
    connect(pendulumAxis.frame_b, pendulumArm.frame_a) annotation (Line(
        points={{58,66},{70,66},{70,12}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(base.frame_b, rotor.frame_a) annotation (Line(
        points={{0,-16},{0,0},{-6.66134e-16,0},{-6.66134e-16,22}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(base.frame_a, fixed.frame_b) annotation (Line(
        points={{0,-36},{0,-42},{4.44089e-16,-42}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(pendulumDamper.flange_b, pendulumAxis.support) annotation (Line(
        points={{38,86},{30,86},{30,76},{42,76}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(pendulumDamper.flange_a, pendulumAxis.axis) annotation (Line(
        points={{58,86},{66,86},{66,76},{48,76}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(rotorDamper.flange_a, rotor.axis) annotation (Line(
        points={{-14,42},{-10,42},{-10,32}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(rotorDamper.flange_b, rotor.support) annotation (Line(
        points={{-34,42},{-40,42},{-40,26},{-10,26}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(pendulumAttachment.frame_b, pendulumAxis.frame_a) annotation (Line(
        points={{24,66},{38,66}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(pendulumAttachment.frame_a, rotor.frame_b) annotation (Line(
        points={{4,66},{0,66},{0,42},{4.44089e-16,42}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(pendulumW.flange, pendulumAxis.axis) annotation (Line(
        points={{79,88},{74,88},{74,76},{48,76}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(pendulumA.flange, pendulumAxis.axis) annotation (Line(
        points={{78,71},{74,71},{74,76},{48,76}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(rotorW.flange, rotor.axis) annotation (Line(
        points={{-20,9},{-24,9},{-24,32},{-10,32}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(rotorA.flange, rotor.axis) annotation (Line(
        points={{-20,-5},{-24,-5},{-24,32},{-10,32}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(pulse.y,disturbance. force) annotation (Line(
        points={{38.6,-32},{48.4,-32}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(disturbance.frame_b, pendulumArm.frame_b) annotation (Line(
        points={{66,-32},{70,-32},{70,-8}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(smallDamper.flange_a,smallRevolute.axis) annotation(Line(points = {{176,40},{182,40},{182,28},{166,28},{166,22}},color = {0,0,0}));
    connect(smallDamper.flange_b,smallRevolute.support) annotation(Line(points = {{156,40},{150,40},{150,28},{160,28},{160,22}},color = {0,0,0}));
    connect(smallRevolute.axis,smallAngleSensor.flange) annotation(Line(points = {{166,22},{190,22},{190,27},{196,27}},color = {0,0,0}));
    connect(smallAngleSensor.flange,smallSpeedSensor.flange) annotation(Line(points = {{196,27},{190,27},{190,1},{196,1}},color = {0,0,0}));
    connect(smallPendulumAttachment.frame_b,smallRevolute.frame_a) annotation(Line(points = {{136,12},{156,12}},color = {95,95,95}));
    connect(smallRevolute.frame_b,smallPendulumArm.frame_a) annotation(Line(points = {{176,12},{184,12},{184,-12}},color = {95,95,95}));
    connect(smallPendulumArm.frame_b,force.frame_b) annotation(Line(points = {{184,-32},{184,-42},{172,-42}},color = {95,95,95}));
    connect(force.force,pulse.y) annotation(Line(points = {{150,-42},{42,-42},{42,-32},{38.6,-32}},color = {0,0,127}));
    connect(smallPendulumAttachment.frame_a,rotor.frame_b) annotation(Line(points = {{116,12},{110,12},{110,48},{2.220446049250313e-15,48},{2.220446049250313e-15,42}},color = {95,95,95}));
    connect(rotor.axis,torque.flange) annotation(Line(points = {{-10,32},{-10,72}},color = {0,0,0}));
    annotation (
      versionDate="2014-02-04",
      Commands(file="Furuta.mos" "Simulate Furuta pendulum", file="Animate.mos"
          "Animate Furuta pendulum"),
      experiment(NumberOfIntervals=5000, StopTime=10),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}),     graphics),uses(Modelica(version = "3.2.3")));
end FurutaPendulum;
