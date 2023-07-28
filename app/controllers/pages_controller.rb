class PagesController < ApplicationController
  def home
    @news = {}
    @news[:news_1] = "In the contest of Universities throughout RSA, Vermillion's Engineering
      faculty swoops in taking first position for the 31st year in a row both in the course content and in student's results. Lecturers attribute their success to the rector's idea of explaining to prompt thinking of the student rather than
       simply teaching facts."
    @news[:news_2] = "Our Control Systems Professor, Prof. Work Supahard has had a break through after 5 years of research into why some women shoot down men in the most brutal ways imaginable. 
      Results conclude some women do it to feel in control even at the cost of losing a good man. The report concludes that while men cant do anything about it, they can be grateful to not 
      be married to such a woman in the first place."
    @news[:news_3] = "Ladies and gentlemen, by all accounts it doesn't make any sense, however, after a 3 year in depth study of electronics our top PHD student has made a scientific breakthrough discovering light matter.
      While it sounds like normal matter that we are able to see, its quite the opposite. From the study Light Matter is in fact so bright that it cannot be observed. It also has particular properties which make it 
      dificult to work with. Light matter requires dark matter and antimatter to be present for its effects to made manifest. For this reason its healing and projectile attributes are yet to be thoroughly explored."
    @news[:news_4] = "Vermillion University has opened their applications for 2024 on July 17th 2023. Applications will close on 21 October 2023, whereafter no new applications will be processed. Prospective students and exhorted 
      to apply sooner rather than later as a first-come first-serve approach (within maintaining the minimum requirements) is applied rather than a better than someone else approach."
  end

  def courses
  end

  def residences
    @residences = {}
    @residences[:novachrono] = "House Novachrono is a house full of aak-shin because Julius came from them. We're always hoping to catch him in a 
        battle but seldom do since he's the most powerful guy on our side for the moment. Like literally to make him 'lose'
        the bad guys gotta pull the lowest of the lows. "
    @residences[:silva]      = "House Silva is the best house since its gifted us Noelle Silva. She is a royal if you somehow forgot but she fell for 
        Asta nonetheless. She's cute like all the time and gives us so much reason to smile. The rest of house Silva is a piece 
        of work though."
    @residences[:vermillion] = "House Vermillion is a fantastic house. Home to Mimosa Vermillion who is gifted both with healing and attacking skills. 
        Her love for Asta is literally one of the things we love most about her. Kirsch was a pain in the butt when we met him 
        but he changed his tune and now he's quite tolerable."
  end

  def about
    @about = {info_1: "Vermillion University was opened in 1561 in the Republic of Knot-Here. The first rector Julius Vermillion laid 
      a solid and timeless foundation of working hard to ensure that things get done. His dreams and goals for the university 
      were all accomplished during his lifetime before his son in learning Asta Silvacquaria took the university to the next 
      level. From 1611 until 1751 the university boasted the best engineering courses and results from students worldwide. 
      The top engineering marvels of the 20th century were all contributed to in the largest means by students from this 
      university. Some of their successes include: The time-machine, the quantam-wall piercer and the atomic-loop-particle 
      accelerator.",
      info_2: "The current rector Merileona Waifu-desu is maintaining the high standard of the university and ensuring that the 
      world of engineering will continue to improve."
    }
  end

  def calendars
    @calendars = {}
    @calendars[:calendar_2022] = "http://www.sun.ac.za/english/Documents/Yearbooks/Current/2023-FMHS-Calendar.pdf"
    @calendars[:calendar_2023] = "https://www.sun.ac.za/english/Documents/Yearbooks/Current/2023-Science.pdf"
    @calendars[:calendar_2024] = "http://www.sun.ac.za/english/Documents/Yearbooks/Current/2023-Engineering.pdf"
  end
  
  def alumni
    @alumni_info = {info_1: "You've gone from being delicate butterflies to being slightly less delicate butterflies. It don't mean nothing unless you
    use your skills to be a blessing to the world. A stuntman's gotta hit his mark."}
  end
  
 
  def careers
  end
  
  def contact_us
  end

  def ap_score
  end

end
