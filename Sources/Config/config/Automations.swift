//
//  Automations.swift
//
//
//  Created by Julian Kahnert on 01.07.24.
//

import HAImplementations
import HAModels

/// Automations that should be used on the HomeAutomation server.
@MainActor
public let getAllAutomations: (Location) -> [any Automatable] = { location in
    print("The location could be used in automations: \(location) ")

    let D = Devices()
    let automations: [any Automatable] = [
        // MARK: - Arbeitszimmer OG
        MotionAtNight(
            "motion-at-night-kitchen",
            noMotionWait: .minutes(15),
            motionSensors: [
                D.kitchenEveMotion
            ],
            lightSensor: D.kitchenEveMotion,
            lights: [
                D.kitchenIkeaLightBulb
            ],
            minBrightness: 0.3),

        // MARK: Garden automations
        Turn(
            .on,
            "turn-on-at-sunset",
            at: Time.sunset(),
            switches: [
                D.gardenIkeaLightBulb
            ]),
        Turn(
            .off,
            "turn-off-at-night",
            at: Time(hour: 23, minute: 45),
            switches: [
                D.gardenIkeaLightBulb
            ])
    ]

    return automations
}
