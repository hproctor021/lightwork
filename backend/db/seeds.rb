# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Workout.delete_all
Exercise.delete_all


users = [
    {name: 'Mateo Yates', email: 'mateo@example.com', password_digest: '1234', is_trainer: true, phone: '512-555-5543', image: 'https://i.guim.co.uk/img/media/010d66e85046f32cab8c92523f31cc780eeea40d/777_738_3815_2289/master/3815.jpg?width=620&quality=85&auto=format&fit=max&s=7e5f8ab766d13251290d74d3657e453e'},
    {name: 'Sis McLaughlin', email: 'sis@example.com', password_digest: '1234', is_trainer: true, phone: '523-354-4536', image: 'http://images.lacotedesmontres.com/img29v/434/img/imgHD/7.jpg'},
    {name: 'Shi Zhiyong', email: 'shi@example.com', password_digest: '1234', is_trainer: true, phone: '324-532-2343', image: 'https://img.koreatimes.co.kr/upload/newsV2/images/202107/8af62a7ed9c14256a08697f3e5e6b699.jpg'},
    {name: 'Cara LeBlon', email: 'cara@example.com', password_digest: '1234', is_trainer: false, phone: '234-533-2345', image: 'https://www.castlehillfitness.com/wp-content/uploads/2019/01/Boxing-in-Austin-Texas-1024x683.jpeg'},
    {name: 'Jenn Nami', email: 'jenn@example.com', password_digest: '1234', is_trainer: false, phone: '643-237-2356', image: 'https://media.self.com/photos/60e76fe01f69d35150b50014/4:3/w_1600,c_limit/GettyImages-1254996115.jpg'},
    {name: 'Guy Fitners', email: 'guy@example.com', password_digest: '1234', is_trainer: false, phone: '893-239-2378', image: 'https://cdn-bmoag.nitrocdn.com/cDToCBiVZvvUAtgfLRwuaEXyiEtVHlLk/assets/static/optimized/rev-566d76c/wp-content/uploads/sam-sabourin-PiFA6HIAfBA-unsplash.jpg'},
    {name: 'Nathan Nuyts', email: 'nathan@example.com', password_digest: '1234', is_trainer: false, phone: '742-532-5789', image: 'https://64.media.tumblr.com/bb6531b1c4f46c1535a4609ba957dfa2/674ee632bc4f76aa-20/s1280x1920/cb86defb1f242b299cab4a557fae52e0eccb269e.jpg'},
    {name: 'O-Ren Ishii', email: 'oren@example.com', password_digest: '1234', is_trainer: false, phone: '987-765-5443', image: 'https://pbs.twimg.com/media/DtbB50mXgAA9leQ?format=jpg&name=4096x4096'}
]

users.each{ | user | User.create(user) }

workouts = [
    {title: 'Lower Body', complete_by: 'Friday, September 2nd', is_complete: false, trainer_id:User.first.id, client_id: User.fourth.id},
    {title: 'Push Day', complete_by: 'Tuesday, August 23rd', is_complete: false, trainer_id:User.second.id, client_id: User.all[6].id},
    {title: 'Pull Day', complete_by: 'Wednesday, August 31st', is_complete: false, trainer_id:User.third.id, client_id: User.all[7].id}

]

workouts.each{ | workout | Workout.create(workout) }

exercises = [
    {workout_id: Workout.first.id, name: 'Squat', sets: 3, reps: 5, weight: 145},
    {workout_id: Workout.first.id, name: 'Bulgarian Split Squat', sets: 4, reps: 12, weight: 50},
    {workout_id: Workout.second.id, name: 'Bench Press', sets: 4, reps: 5, weight: 120},
    {workout_id: Workout.second.id, name: 'Shoulder Press', sets: 4, reps: 10, weight: 40},
    {workout_id: Workout.third.id, name: 'Face Pulls', sets: 4, reps: 10, weight: 35},
    {workout_id: Workout.third.id, name: 'Seated Row', sets: 4, reps: 8, weight: 80}
]

exercises.each{ | exercise | Exercise.create(exercise) }