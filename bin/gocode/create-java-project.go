package main

import (
    "fmt"
)

func main() {

    var groupId, artifactId, projectName string
    fmt.Printf(" Enter ProjectName : ")
    fmt.Scanln(&projectName)
    fmt.Printf(" Enter GroupId (Eg. org.apache.maven.plugins) : ")
    fmt.Scanln(&groupId)
    fmt.Printf(" Enter ArtifactID (Eg. maven-compiler-plugin) : ")
    fmt.Scanln(&artifactId)

    mavenExecutionCommand := fmt.Sprintf(`
        mvn archetype:generate 
        -DgroupId=%s 
        -DartifactId=%s 
        -DarchetypeArtifactId=%s 
        -DinteractiveMode=false`, groupId, artifactId, "maven-archetype-quickstart")

    fmt.Println(mavenExecutionCommand)
}
