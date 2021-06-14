Feature: On mélange les couleurs

  Scenario Outline: Couleurs primaires
  
    Given la couleur 1 est <color1>
      And la couleur 2 est <color2>
     When je mélange
     Then la couleur mélangée est <result>
  
    Examples:
      | color1 | color2 | result |
      | red    | red    | red    |
      | yellow | yellow | yellow |
      | blue   | blue   | blue   |
      | red    | yellow | orange |
      | red    | blue   | purple |
      | blue   | yellow | green  |
      | blue   | red    | purple |
      | yellow | red    | orange |
      | yellow | blue   | green  |
  
