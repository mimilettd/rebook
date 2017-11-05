require 'rails_helper'

feature "User can view books" do
  scenario "by category" do

    Book.create(category: Category.find_or_create_by(name: "Dystopian"), publisher: Publisher.find_or_create_by(name: "Scholastic, Inc."), title: "The Hunger Games", subtitle: "Hunger Games Series #1", author: "Suzanne Collins", description: "In the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts. The Capitol is harsh and cruel and keeps the districts in line by forcing them all to send one boy and one girl between the ages of twelve and eighteen to participate in the annual Hunger Games, a fight to the death on live TV. Sixteen-year-old Katniss Everdeen, who lives alone with her mother and younger sister, regards it as a death sentence when she is forced to represent her district in the Games. But Katniss has been close to dead before-and survival.", ISBN: "9780439023481", image_url: "https://prodimage.images-bn.com/pimages/9780439023528_p0_v1_s550x406.jpg")

    Book.create(category: Category.find_or_create_by(name: "Dystopian"), publisher: Publisher.find_or_create_by(name: "Scholastic, Inc."), title: "Catching Fire", subtitle: "Hunger Games Series #2", author: "Suzanne Collins", description: "Against all odds, Katniss Everdeen has won the annual Hunger Games with fellow district tribute Peeta Mellark. But it was a victory won by defiance of the Capitol and their harsh rules. Katniss and Peeta should be happy. After all, they have just won for themselves and their families a life of safety and plenty. But there are rumors of rebellion among the subjects, and Katniss and Peeta, to their horror, are the faces of that rebellion. The Capitol is angry. The Capitol wants revenge.", ISBN: "9780439023498", image_url: "https://prodimage.images-bn.com/pimages/9780545586177_p0_v2_s550x406.jpg")

    Book.create(category: Category.find_or_create_by(name: "Dystopian"), publisher: Publisher.find_or_create_by(name: "Scholastic, Inc."), title: "Mockingjay", subtitle: "Hunger Games Series #3", author: "Suzanne Collins", description: "Katniss Everdeen, girl on fire, has survived, even though her home has been destroyed. There are rebels. There are new leaders. A revolution is unfolding. District 13 has come out of the shadows and is plotting to overthrow the Capitol. Though she's long been a part of the revolution, Katniss hasn't known it. Now it seems that everyone has had a hand in the carefully laid plans but her.", ISBN: "9780439023511", image_url: "https://prodimage.images-bn.com/pimages/9780545663267_p0_v2_s550x406.jpg")

    visit '/'

    click_on "Browse ReBook"

    click_on "Dystopian"

    expect(current_path).to eq("/dystopian")

    expect(page).to have_css(".book", count: 3)
  end
end
