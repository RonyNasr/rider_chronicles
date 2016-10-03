FactoryGirl.define do
  factory :bike do
    make("BMW")
    model("S1000RR")
    year("1998")
    color("black")
    engine("1000cc")
    gearbox("manual")
    drivetrain("chain")
    user
  end
end
