//
//  Devices.swift
//
//
//  Created by Julian Kahnert on 01.07.24.
//

import HAImplementations
import HAModels

/// Rooms in your HomeKit system, e.g. in the Home.app on iOS/macOS.
extension PlaceId {
    public static let kitchen = "Kitchen"
    public static let garden = "Garden"
}

/// Devices in your HomeKit system, e.g. a light bulb or a motion sensor.
struct Devices {
    // MARK: - Kitchen
    let kitchenEveMotion = EveMotion(
        query: .init(placeId: .kitchen, name: "Eve Motion"))
    let kitchenIkeaLightBulb = LightBulbWhite(
        query: .init(placeId: .kitchen, name: "Light"))

    // MARK: - Garden
    let gardenIkeaLightBulb = GenericSwitch(
        query: .init(placeId: .garden, name: "Garage Light"))
}
