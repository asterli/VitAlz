//
//  NewItemView.swift
//  VitAlz
//
//  Created by Jonathan Wu on 2/17/24.
//

import SwiftUI

struct MedicineView: View {
    @State private var selectedStrength = "Mild"
    let strengths = ["Aducanumab", "Lecanemab", "Suvorexant"]
    @StateObject var miewModel = MedicineViewModel()
    @Binding var mewItemPresented: Bool
    @State private var selectedDate = Date()

    let notify = NotificationHandler()
    var body: some View {
        VStack{
            Text("Pick a medicine")
                .font(.system(size:32))
                .bold()
                .padding(20)
            
            Form{
                Section {
                    Picker("Strength",selection:$miewModel.title) {
                        ForEach(strengths, id: \.self) {
                                Text($0)
                            }
                        }
                    .pickerStyle(.wheel)
                }
                
                TextField("How much is the dosage?", text: $miewModel.number)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                DatePicker("Time", selection: $miewModel.date, displayedComponents: .hourAndMinute)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title:"Save", background: .pink){
                    if miewModel.canSave{
                        miewModel.save()
                        mewItemPresented = false
                    } else {
                        miewModel.showAlert = true
                    }
                    notify.sendNotification(date: miewModel.date, type: "date", title: "VitAlz", body: miewModel.title)
                }
                .padding()
                
            }
            
            .alert(isPresented: $miewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select a date that is today or newer"))
            })
        }
    }
}

struct MedicineView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineView(mewItemPresented: Binding(get: {
            return true
        }, set: { _ in
        }))
    }
}
