name := "ScalaTest"

version := "0.1"

scalaVersion := "2.13.3"

ThisBuild / useCoursier := false


libraryDependencies += "org.scalactic" %% "scalactic" % "3.2.0"

libraryDependencies += "org.scalatest" %% "scalatest" % "3.2.0" % Test

libraryDependencies += "junit" % "junit" % "4.10" % Test