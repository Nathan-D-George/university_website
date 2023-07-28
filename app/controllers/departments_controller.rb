class DepartmentsController < ApplicationController
  def departments
    @departments = {}
    @departments[:civil]       = "Our department of Civil Engineering boasts top marks in the country and top exposure to practical aspects of the studies."
    @departments[:mechanical]  = "Our department of Mechanical Engineering boasts to marks in the land and top exposure to practical aspects of the studies."
    @departments[:electronic]  = "Our department of Electronic Engineering has maintained the absolute highest level of abstract thought patterns ever 
        seen before. The studies are literally bluring the lines beteen real and imaginary in a completely abstract yet manifest 
        way."
    @departments[:mechatronic] = "Our department of Mechatronic Engineering has constantly produced the top robotics projects for the last 12 years. The 
        top academic marks have also constantly come from our company for the last 21 years. The levels of exposure to practical 
        aspects of the studies are fantastically incorporated wherever possible."
    
    @departments[:civil_p]       = "https://images.unsplash.com/photo-1466285746891-30d1cd3a5409?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGJyaWRnZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"
    @departments[:electronic_p]  = "https://images.unsplash.com/photo-1562408590-e32931084e23?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZWxlY3Ryb25pY3N8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"
    @departments[:mechanical_p]  = "https://images.unsplash.com/photo-1567789884554-0b844b597180?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FyJTIwZmFjdG9yeXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"
    @departments[:mechatronic_p] = "https://media.istockphoto.com/id/1278639909/photo/future-technology-in-black-prosthetic-hand-on-white-3ds-max-render-futuristic-innovation.webp?b=1&s=170667a&w=0&k=20&c=h2j78bXVvLtePD-QArKb7PBEPu5wVQorQt6H_ecTWeE="
  end
  
  def electronic
    @electronic = {}
    @electronic[:info_1] = "Electronic Engineering invloves studying electronic principles and components to the lowest level possible. 
      These skills are used together to build a variety of different products that are used in everyday life; 
      ranging from the smartwatch to the satelite flying over Earth."
    @electronic[:info_2] = "A love for mathematics, physical science and problem solving will serve as a good starting place. Interest in 
      how electronic work on their own or in a system could mean that this is just right for you."
    @electronic[:info_3] = "A custom VU AP score of 600 is required to be eligible for this course. Use the link below to check your eligibility for 
      the course according to your most recent marks. "
  end
  
  def mechatronic
    @mechatronic = {}
    @mechatronic[:info_1] = "Mechatronic Engineering invloves studying electronic and mechanical principles and components to the lowest level 
      possible. This is complimented with studies in computer sciences to make them a jack of all trades.
      These skills are used together to build a variety of different products such as robots, assembly lines or automotive 
      products."
    @mechatronic[:info_2] = "A love for mathematics, physical science and problem solving will serve as a good starting place. Interest in 
      how electronic components and their mechanical frameworks work on their own or in a system could mean that this 
      is just right for you."
    @mechatronic[:info_3] = "A custom VU AP score of 610 is required to be eligible for this course. Use the link below to check your eligibility for 
      the course according to your most recent marks."
  end
  
  def mechanical
    @mechanical = {}
    @mechanical[:info_1] = "Mechanical Engineering invloves studying mechanical/structural principles and components to the lowest level possible. 
      These skills are used together to build a variety of different products that are vitally important for people; 
      ranging from the cars to pipelines retrieving oil from beneath the ocean floor."
    @mechanical[:info_2] = "A love for mathematics, physical science and problem solving will serve as a good starting place. Interest in 
      how mechanical components work on their own or in a system could mean that this is just right for you."
    @mechanical[:info_3] = "A custom VU AP score of 590 is required to be eligible for this course. Use the link below to check your eligibility for 
      the course according to your most recent marks."
  end
  
  def civil
    @civil = {}
    @civil[:info_1] = "Civil Engineering invloves studying structural mechanics to the lowest level possible. These skills are used 
      to build a variety of different structure that are everywhere around us; ranging from the houses to skyscrapers 
      such as the Burj Khlaifa and the San Fransisco Suspension Bridge."
    @civil[:info_2] = "A love for mathematics, physical science and problem solving will serve as a good starting place. Interest in 
      how concrete dries, it could indicate that this is just right for you."
    @civil[:info_3] = "A custom VU AP score of 590 is required to be eligible for this course. Use the link below to check your eligibility for 
      the course according to your most recent marks."
  end
end