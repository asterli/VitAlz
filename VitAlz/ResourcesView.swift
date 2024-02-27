//
//  Resources.swift
//  VitAlz
//
//  Created by Riana Santos on 2/17/24.
//

import SwiftUI

struct ResourceView: View{
    var body: some View{
        NavigationSplitView{
            Text("Resources")
                .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                .font(.custom("Utendo-Black", size: 40))
            ZStack {
                RoundedRectangle(cornerRadius: 15).foregroundColor(Color.purple.opacity(0.1))
                NavigationLink {
                    ScrollView{
                        Text("What is Alzheimer's?")
                            .font(.custom("Utendo-Black", size: 40))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(.vertical, 20)
                        Text("**Alzheimer's is a type of brain disease caused by damage to nerve cells. There's currently no cure.**")
                            .font(.custom("Utendo-Semibold", size: 30))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .frame(alignment: .leading)
                            .padding(5)
                        Text("""
                        The first damaged neurons are responsible for memory, language, and thinking. These brain changes can start 20 years or more before symptoms begin to appear.
                        """)
                        .font(.custom("Utendo-Regular", size: 20))
                        .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                        .padding(5)
                        Text("Alzheimer Disease Continuum: Progression Stages")
                            .font(.custom("Utendo-Black", size: 40))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .frame(alignment: .leading)
                            .padding(.vertical, 20)
                        Image("screenshot")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("""
                        The pre-clinical stage is within that 20 years or so where Alzheimer's starts to develop. Once symptoms begin to appear during the mild cognitive impairment stage, people with Alzheimer's will have biomarker evidence of the disease. 15% of people in this stage will develop Alzheimer's Dementia within 2 years, and 1/3 of people will progress within 5 years.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                        Text("""
                        Alzheimer's Dementia is further divided into three stages based on severity. People with mild Alzheimer's Dementia may experience apathy, depression, or difficulty remembering events, conversations, or names. In moderate Alzheimer's Dementia, common new symptoms are confusion, communication difficulties, poor judgment, and behavioral changes. The very last stage of Alzheimer's disease can result in difficulties swallowing, walking or speaking.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                        Text("Treatment Options")
                            .font(.custom("Utendo-Black", size: 40))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(.vertical, 20)
                        Text("""
                        Although there is no cure for Alzheimer's, there are many different drug and non-drug treatment options for patients. Please discuss with the patient's primary care physician to determine what drug treatment is best. Some non-drug treatment options can involve physical activity, memory and orientation exercises, music and art based exercises, and support groups.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                        Text("""
                        DISCLAIMER: THIS APP IS NOT MEANT TO BE USED AS A DIAGNOSTIC TOOL. VitAlz primary goal is to provide information about Alzheimer's disease. The information provided can be found on the Alzheimer's Association's website. Please consult your doctor or other qualified healthcare professional with any questions or concerns you may have related to Alzheimer's disease or dementia. Do not disregard advice or delay treatment due to content provided in this app.
                        """)
                            .font(.custom("Utendo-Semibold", size: 20))
                            .foregroundColor(.purple)
                            .padding(.vertical, 15)
                    }
                } label:{
                    Text("Alzheimer's Disease\nInfo")
                        .padding(50)
                        .font(.custom("Utendo-Bold", size: 25))
                    }
            }
            .padding(.horizontal, 20)
            ZStack {
                RoundedRectangle(cornerRadius: 15).foregroundColor(Color.purple.opacity(0.1))
                NavigationLink {
                    ScrollView{
                        Text("Risk Factors for Alzheimer's")
                            .font(.custom("Utendo-Black", size: 40))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(.vertical, 20)
                        Text("""
                            - Age
                            - Genetics
                            - Family History
                            - Cardiovascular Health
                            - Smoking
                            - Diet
                            - Physical Activity
                            - Education Level
                        """)
                            .font(.custom("Utendo-Regular", size: 30))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(.horizontal, 5)
                        Text("Caregiver Risks")
                            .font(.custom("Utendo-Black", size: 40))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(.vertical, 20)
                        Text("""
                            - Depression
                            - Anxiety
                            - Increased Stress
                            - Chronic Health Conditions
                        """)
                            .font(.custom("Utendo-Regular", size: 30))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(.horizontal, 5)
                        Text("Ways to Minimize Risk")
                            .font(.custom("Utendo-Black", size: 40))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(.vertical, 20)
                        Text("""
                        Though many of the risk factors for Alzheimer's disease is tough to mitigate, keeping a healthy diet and exercising regularly can help lower the risk of nerve cell damage that causes Alzheimer's. For those already suffering from Alzheimer's and/or Dementia, leaning on the support from loved ones can make navigating symptoms easier.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                        Text("""
                        Caregivers can implement similar tips when supporting the patient is difficult. Please reach out to a medical professional if you or someone you know shows signs of depression.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                        Text("""
                        DISCLAIMER: THIS APP IS NOT MEANT TO BE USED AS A DIAGNOSTIC TOOL. VitAlz primary goal is to provide information about Alzheimer's disease. The information provided can be found on the Alzheimer's Association's website. Please consult your doctor or other qualified healthcare professional with any questions or concerns you may have related to Alzheimer's disease or dementia. Do not disregard advice or delay treatment due to content provided in this app.
                        """)
                            .font(.custom("Utendo-Semibold", size: 20))
                            .foregroundColor(.purple)
                            .padding(.vertical, 15)
                    }
                } label:{
                    Text("Associated Risks")
                        .padding(50)
                        .font(.custom("Utendo-Bold", size: 25))
                }
            }
            .padding(.horizontal, 20)
            ZStack {
                RoundedRectangle(cornerRadius: 15).foregroundColor(Color.purple.opacity(0.1))
                NavigationLink {
                    ScrollView{
                        Group {
                            Text("Alzheimer's in the US")
                                .font(.custom("Utendo-Black", size: 40))
                                .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                                .padding(.vertical, 20)
                            Text("""
                        Over **6 million people** have Alzheimer's.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                            Text("""
                        Alzheimer's accounts for **60-80%** of dementia cases.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                            Text("""
                        The age of lifetime risk is **45**. 1 in 5 women and 1 in 10 men are likely to develop Alzheimer's at that age.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                            Text("""
                        Minorities are **disproportionately more likely** to develop Alzheimer's
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                        }
                        Group{
                            Text("""
                        As of 2020, Alzheimer's is the **7th leading cause of death** in the US. 1 in 3 senior citizens pass away with the disease or some form of dementia.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                            Text("""
                        **Only 4 in 10** people would see a doctor once they begin noticing memory and cognitive loss. Symptoms are often brushed off as "age-related" issues, decreasing the chance of early detection.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                            Text("Alzheimer's Caregiver Facts")
                                .font(.custom("Utendo-Black", size: 40))
                                .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                                .padding(.vertical, 20)
                            Text("""
                        **83%** of caregivers are **family members** of the patient. Over half of those caregivers are providing care for a parent or an in-law.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                            Text("""
                        **2/3** of caregivers are women.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                            Text("""
                        **66%** of caregivers live with the patient.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                            Text("""
                        **30%** caregivers are 65+ and **23%** are 18-49yrs old.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                            Text("""
                        Hispanic, Black and Asian American dementia caregivers indicate **greater care demands, less outside help/formal service use and greater depression** compared with White caregivers.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                            Text("""
                        In 2022, the estimated cost of unpaid care across the US was **$339.5 billion**.
                        """)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                        }
                    }
                } label:{
                    Text("Disease Statistics")
                        .padding(50)
                        .font(.custom("Utendo-Bold", size: 25))
                }
            }
            .padding(.horizontal, 20)
            ZStack {
                RoundedRectangle(cornerRadius: 15).foregroundColor(Color.purple.opacity(0.1))
                NavigationLink {
                    Text("24/7 Helpline")
                        .font(.custom("Utendo-Black", size: 40))
                        .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                        .padding(.vertical, 30)
                    Text("800.272.3900")
                        .font(.custom("Utendo-Regular", size: 20))
                        .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                        .padding(5)
                    Text("Donate")
                        .font(.custom("Utendo-Black", size: 40))
                        .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                        .padding(.vertical, 30)
                    Link("Alzheimer's Association", destination: URL(string: "https://act.alz.org/site/Donation2?df_id=57149&mfc_pref=T&57149.donation=form1&_gl=1*qtbo0k*_ga*MjQ1MTQ5NDM3LjE3MDgyMTY0ODk.*_ga_QSFTKCEH7C*MTcwODI2ODE5OS4yLjEuMTcwODI2ODQ2Ni4zMC4wLjA.*_ga_9JTEWVX24V*MTcwODI2ODIwMS4yLjEuMTcwODI2ODQ2Ni4zMC4wLjA.")!)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                    Text("App Support")
                        .font(.custom("Utendo-Black", size: 40))
                        .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                        .padding(.vertical, 30)
                    Link("VitAlz DevPost", destination: URL(string: "https://devpost.com/software/vitalz")!)
                            .font(.custom("Utendo-Regular", size: 20))
                            .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                            .padding(5)
                } label:{
                    Text("Connect")
                        .padding(50)
                        .font(.custom("Utendo-Bold", size: 25))
                }
            }
            .padding(.horizontal, 20)
        }detail: {
            Text("Select an item")
        }
    }
}
        
