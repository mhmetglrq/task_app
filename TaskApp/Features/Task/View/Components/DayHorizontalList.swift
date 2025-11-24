//
//  DayHorizontalList.swift
//  TaskApp
//
//  Created by Mehmet Güler on 23.11.2025.
//

import SwiftUI

struct DayHorizontalList: View {
    let monthDays = DayModel.monthDays(for: Date())
    
    // Başlangıçta bugünün gün numarasını seç
    @State private var selectedDayNumber: Int = Calendar.current.component(.day, from: Date())
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(monthDays) { day in
                        DayCard(day: day, selectedDayNumber: $selectedDayNumber)
                            .id(day.id)
                    }
                }
                .padding(.horizontal, 10)
            }
            .onAppear {
                if let today = monthDays.first(where: { $0.isToday }) {
                    withAnimation(.easeInOut) {
                        proxy.scrollTo(today.id, anchor: .center)
                    }
                }
            }
        }
        .frame(height: 200)
    }
}

struct DayCard: View {
    let day: DayModel
    @Binding var selectedDayNumber: Int
    
    var body: some View {
        let isSelected = day.dayNumber == selectedDayNumber
        
        Button {
            withAnimation(.interactiveSpring) {
                selectedDayNumber = day.dayNumber
            }
        } label: {
            VStack {
                Text(day.dayNameShort)
                    .font(.system(.title2, design: .rounded))
                    .padding(10)
                
                Text("\(day.dayNumber)")
                    .font(.system(.title, design: .rounded))
                    .padding(10)
            }
            .foregroundStyle(day.isToday || isSelected ? .white : .primary)
            .bold()
            // 🎨 Sadece bugün / seçili günlerde arka plan rengi
            .background(
                day.isToday
                ? Color.orange
                : (isSelected ? Color.blue : Color.clear)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            // ⭕ Border'ı background DEĞİL overlay ile veriyoruz
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        Color.gray.opacity(day.isToday || isSelected ? 0 : 1),
                        lineWidth: 1
                    )
            )
            .aspectRatio(3/4, contentMode: .fit)
        }
        // 🔕 Varsayılan buton arka planını kapat
        .buttonStyle(.plain)
    }
}

#Preview {
    DayHorizontalList()
}
