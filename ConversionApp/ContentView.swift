//
//  ContentView.swift
//  ConversionApp
//
//  Created by Samar Kalra on 04/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 0.00
    @State private var currentUnit = "liters"
    @State private var conversionUnit = "milliliters"
    @FocusState private var isValueTextFieldFocussed: Bool
    let units = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    var convertedVolume: String {
        var conversion = 0.00
        
        if(currentUnit == "liters" && conversionUnit == "milliliters") {
            conversion = value * 1000
        } else if(currentUnit == "liters" && conversionUnit == "liters") {
            conversion = value
        } else if(currentUnit == "liters" && conversionUnit == "cups") {
            conversion = value * 4.167
        } else if(currentUnit == "liters" && conversionUnit == "pints") {
            conversion = value * 2.113
        } else if(currentUnit == "liters" && conversionUnit == "gallons") {
            conversion = value / 3.785
        }
        return String(format: "%.2f", Double(conversion))
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("EnterValue", value: $value, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($isValueTextFieldFocussed)
                
                Section {
                        Picker("From", selection: $currentUnit) {
                            ForEach(units, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        Picker("To", selection: $conversionUnit) {
                            ForEach(units, id: \.self) {
                                Text("\($0)")
                            }
                        }

                }
            
                Text(convertedVolume)
            }
            .navigationTitle("Volume Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard, content: {
                    Spacer()
                    
                    Button("Done") {
                        isValueTextFieldFocussed = false
                    }
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
