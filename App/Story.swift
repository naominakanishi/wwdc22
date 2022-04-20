private let intro: [State] = [
    .init(
        label: "This Playgound might be disturbing for people with hypersensitivity to sound or light.\n\nTo continue, tap anywhere on the screen.",
        position: .center),
    .init(
        audio: Audio(fileName: "intro-wwdc-2", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "Picture yourself calm and relaxed.",
            position: .center
        ),
        imageName: "background"
    ),
    .init(
        audio: Audio(fileName: "intro-wwdc-3", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "Suddenly, a stereo blasts in your ears,",
            position: .center
        ),
        imageName: "background"
    ),
    
    .init(
        audio: Audio(fileName: "intro-wwdc-4", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "and you are punched in the arm...",
            position: .center
        ),
        imageName: "background"
    ),
    .init(
        audio: Audio(fileName: "intro-wwdc-5", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "For people with sensory problems, such auditory hypersensitivity might occur in a noisy classroom or hallway.",
            position: .center
        ),
        imageName: "background"
    ),
    .init(
        audio: Audio(fileName: "intro-wwdc-6", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "In this playground, I'll share an experience I've had as an autistic person in an attempt to show how people in the spectrum might react to sensorial experiences.",
            position: .center
        ),
        imageName: "background"
    ),
]

private let context: [State] = [
    .init(
        audios: [
            Audio(fileName: "context-wwdc-1", repeatsForever: false, volume: 1.0, delay: .seconds(1)),
            Audio(fileName: "talking-6sec", repeatsForever: true, volume: 0.05),
            Audio(fileName: "tapping-6sec", repeatsForever: true, volume: 0.05),

        ],
        subtitle:
                .init(
                    label: "In the University I attended, we sometimes had dynamic classes.",
                    position: .bottom
                ),
          imageName: "classroom-color",
          transition: .zoomIn(.init(x: 275, y: 123), 0.4, 0.3)
    ),
    .init(
        audio: Audio(fileName: "context-wwdc-2", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "On that specific day I was feeling very anxious since I had a test later that morning. So, I was trying to focus on reading and studying for it. ",
            position: .bottom),
        imageName: "classroom-me",
        transition: .reset
    ),
]

private let studying: [State] = [
    .init(
        audio: Audio(fileName: "studying-wwdc-1", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "Many people with autism have trouble processing everyday sensory information. In my case in particular, it gets harder in situations in which I'm anxious or nervous.",
            position: .bottom
        ),
        imageName: "studying-1"),
    
        .init(
            audio: Audio(fileName: "studying-wwdc-2", repeatsForever: false, volume: 1.0),
            subtitle: .init(
                label: "Even though the sounds people were making in the classroom would be okay for most people, they started to make me feel more and more overwhelmed.",
                position: .bottom
            ),
            imageName: "studying-2",
            transition: .zoomIn(.init(x: 275, y: 123), 0.4, .zero)),
]



private let typing: [State] = [
    .init(
        audio: Audio(fileName: "typing-wwdc-1", repeatsForever: false, volume: 1.0),
        subtitle: .init(
        label: "Even small noises may be a trigger.",
        position: .bottom
        ),
        imageName: "classroom-typing", transition: .reset),
    
    .init(
        audios: [
            Audio(fileName: "typing-wwdc-2", repeatsForever: false, volume: 1.0),
            Audio(fileName: "typing-sound-1", repeatsForever: false, volume: 0.3, delay: .seconds(3)),
        ],
        subtitle: .init(
            label: "Even though it's not especifically loud, something that may sound like...",
            position: .top
        ),
        imageNames: ["typing-1", "typing-2"]
    ),
    
    .init(
        audios: [
            Audio(fileName: "typing-wwdc-3", repeatsForever: false, volume: 1.0),
            Audio(fileName: "typing-sound-2", repeatsForever: false, volume: 4.0, delay: .seconds(3)),
        ],
        subtitle: .init(
            label: "...may sound like someone's using their keyboard right by your ear.",
            position: .top
        ),
        imageNames: ["typing-1", "typing-2"],
        transition: .zoomIn(.init(x: 275, y: 123), 0.4, .zero)
    )
]

private let talking: [State] = [
    .init(
        audio: Audio(fileName: "talking-wwdc-1", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "People talk in different volumes, sure...",
            position: .bottom
        ),
        imageName: "classroom-talking",
        transition: .reset
    ),
    
    
    .init(
        audios: [
            Audio(fileName: "talking-wwdc-2", repeatsForever: false, volume: 1.0),
            Audio(fileName: "talking-1", repeatsForever: false, volume: 0.1),
            Audio(fileName: "talking-2", repeatsForever: false, volume: 4.0, delay: .seconds(3))
        ],

        subtitle: .init(label: "but sometimes it feels like people are yelling right by your side.",
                        position: .top),
        imageName: "talking-1",
        transition: .zoomIn(.init(x: 275, y: 123), 0.4, .zero)
    )
]

private let tappingPen: [State] = [
    .init(
        audio: Audio(fileName: "tapping-wwdc-1", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "Repetitive noises, such as a person tapping their pen on a desk might also be very triggering. ",
            position: .bottom
        ),
        imageName: "classroom-tappingPen",
        transition: .reset
    ),    
    .init(
        audios: [
            Audio(fileName: "tapping-wwdc-2", repeatsForever: false, volume: 1.0),
            Audio(fileName: "tapping-6sec", repeatsForever: false, volume: 6.0, delay: .seconds(2))
        ],
        subtitle: .init(label: "That day, just as the other noises, it kept on getting amplified, sometimes mixed with other sounds, sometimes isolated.",
                        position: .top),
        imageNames: ["tapping-1", "tapping-2"]
    )
]

private let overwhelming: [State] = [
    .init(
        audio: Audio(fileName: "overwhelming-wwdc-1", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "At a certain point, it wasn't just about not being able to focus anymore.",
            position: .top
        ),
        imageName: "overwhelming-1"
    ),
    .init(
        audio: Audio(fileName: "overwhelming-wwdc-2", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "It became impossible to bear with the sounds.",
            position: .top
        ),
        imageName: "overwhelming-2"
    ),
    .init(
        audio: Audio(fileName: "overwhelming-wwdc-3", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "The lights also started feeling too bright...",
            position: .top,
            color: .white
        ),
        imageName: "overwhelming-3"
    ),
    .init(
        audio: Audio(fileName: "overwhelming-wwdc-4", repeatsForever: false, volume: 1.0),
        subtitle: .init(
            label: "Suddenly, I was stuck with my head between my arms, unable ask for help, or even move at all.",
            position: .top,
            color: .white
        ),
        imageName: "overwhelming-4"
    ),
]

private let chapters: [[State]] = [
    intro,
    context,
    studying,
    typing,
    talking,
    tappingPen,
    overwhelming,
    
]

extension StateMachine {
    var states: [State] {
        chapters.flatMap { $0 } + [
            .overwhelming
        ]
    }
}

extension State {
    static let overwhelming: State = .init(
        audios: [],
        imageNames: ["nonExistant"]
    )
}
