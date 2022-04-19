private let intro: [State] = [
    .init(label: "This Playgound might be disturbing for people with hypersensitivity to sound or light.", position: .center),
    .init(label: "Picture yourself calm and relaxed.", position: .center),
    .init(label: "suddenly, a stereo blasts in your ears,", position: .center),
    .init(label: "and you are punched in the arm...", position: .center),
    .init(label: "For someone with sensory problems, such auditory hypersensitivity might occur in a noisy classroom or hallway.", position: .center),
    .init(
        label: "In this playground, I'll share an experience I had as an autistic person as an attempt to show neurotypical people how we might react to sensorial experiences.",
        position: .center),
]

private let context: [State] = [
    .init(subtitle:
                .init(
                    label: "In the University I attended, we had these dynamic classes... In this specific day I was feeling very anxious since I had a test later that morning, so I was trying to focus on reading and studying for it. ",
                    position: .bottom
                ),
          imageName: "classroom-color",
          transition: .zoomIn(.init(x: 275, y: 123), 0.4, 0.3)
         ),
    .init(imageName: "classroom-me", transition: .reset),
]

private let studying: [State] = [
    .init(
        subtitle: .init(
            label: "Many people with autism have trouble processing everyday sensory information. In my case in particular, it gets harder in situations I'm feeling anxious or nervous.",
            position: .bottom
        ),
        imageName: "studying-1"),
    
        .init(
            subtitle: .init(
                label: "Even though the sounds people were making in the classroom were okay for most people, it started getting more and more overwhelming.",
                position: .bottom
            ),
            imageName: "studying-2",
            transition: .zoomIn(.init(x: 275, y: 123), 0.4, .zero)),
]



private let typing: [State] = [
    .init(imageName: "classroom-typing", transition: .reset),
    .init(
        subtitle: .init(
            label: "Even small noises may be a trigger. Even though it's not especifically loud, something that may sound like [insert normal typing sound] may sound like someone's using their keyboard right on your ear. [insert loud typing noise]",
            position: .top
        ),
        imageNames: ["typing-1", "typing-2"],
        transition: .zoomIn(.init(x: 275, y: 123), 0.4, .zero)
    )
]

private let talking: [State] = [
    .init(
        subtitle: .init(
            label: "People talk in different volumes, sure...",
            position: .bottom
        ),
        imageName: "classroom-talking",
        transition: .reset
    ),
    
    
    .init(
        subtitle: .init(label: "but sometimes it feels like people are yelling right by your side.",
                        position: .top),
        imageName: "talking-1",
        transition: .zoomIn(.init(x: 275, y: 123), 0.4, .zero)
    )
]

private let tappingPen: [State] = [
    .init(
        subtitle: .init(
            label: "Repetitive noises, such as a person tapping their pen on a desk might also be very triggering. ",
            position: .bottom
        ),
        imageName: "classroom-tappingPen",
        transition: .reset
    ),
    
    
    .init(
        subtitle: .init(label: "Just as others, it keeps on getting amplified, sometimes mixed with other sounds, sometimes isolated.",
                        position: .top),
        imageNames: ["tapping-1", "tapping-2"]
    )
]

private let overwhelming: [State] = [
    .init(
        subtitle: .init(
            label: "At a certain point, it wasn't about not being able to focus anymore.",
            position: .top
        ),
        imageName: "overwhelming-1"
    ),
    .init(
        subtitle: .init(
            label: "It became impossible to bear with the sounds.",
            position: .top
        ),
        imageName: "overwhelming-2"
    ),
    .init(
        subtitle: .init(
            label: "The lights started getting too bright.",
            position: .top,
            color: .white
        ),
        imageName: "overwhelming-3"
    ),
    .init(
        subtitle: .init(
            label: "Suddenly I was stuck with my head between my arms, unable to speak or ask for help.",
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
            .init(
                subtitle: .init(
                    label: "Suddenly I was stuck with my head between my arms, unable to speak or ask for help.",
                    position: .top,
                    color: .white
                ),
                imageName: "overwhelming-4"
            ),
            .overwhelming
        ]
    }
}

extension State {
    static let overwhelming: State = .init(
        audioName: "nonExistant", imageName: "nonExistant"
    )
}
