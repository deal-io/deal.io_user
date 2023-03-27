//
//  OpenMapsView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 3/27/23.
//

import SwiftUI
import MapKit

struct OpenMapsView: View {
    @ObservedObject var viewModel: UserViewModel
    var canOpenGoogleMaps: Bool {
        return UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!)
    }
    var deal: Deal
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: {
            action()
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(viewModel.locationMap[deal.restaurantID] ?? "") { placemarks, error in
                guard let placemark = placemarks?.first, let coordinate = placemark.location?.coordinate else {
                    return
                }
                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
                mapItem.name = viewModel.locationMap[deal.restaurantID]
                mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
            }
        }) {
            Text("Open in Apple Maps")
                .foregroundColor(.white)
                .background() {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Deal_ioColor.selected)
                        .frame(width: 170, height: 26)
                }
        }
    }
}
