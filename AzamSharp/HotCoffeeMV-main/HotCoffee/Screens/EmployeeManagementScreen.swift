//
//  EmployeeManagementScreen.swift
//  HotCoffee
//
//  Created by Thomas Cowern on 5/6/25.
//
import SwiftUI

struct EmployeeManagementScreen: View {
    
    @Environment(OrderingStore.self) private var orderingStore
    @Environment(EmployeeStore.self) private var employeeStore
    
    var body: some View {
        List {
            Section("Orders") {
                ForEach(orderingStore.orders) { order in
                    Text(order.coffeeName)
                }
            }
            
            Section("Employees") {
                ForEach(employeeStore.employees) { employee in
                    Text(employee.name)
                }
            }
        }
    }
}

#Preview {
    EmployeeManagementScreen()
        .environment(EmployeeStore(httpClient: HTTPClient()))
        .environment(OrderingStore(httpClient: HTTPClient()))
}
