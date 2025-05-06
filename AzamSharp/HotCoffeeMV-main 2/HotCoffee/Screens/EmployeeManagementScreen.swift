//
//  EmployeeManagementScreen.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 4/8/24.
//

import SwiftUI

struct EmployeeManagementScreen: View {
    
    // EmployeeManagementScreen    MVVM -> EmployeeManagementViewModel
    // OrderListScreen      MVVM -> OrderListViewModel
    // AddOrderScreen       MVVM -> AddOrderViewModel
    // OrderDetailScreen    MVVM -> OrderDetailViewModel
    @Environment(OrderingStore.self) private var orderingStore
    @Environment(EmployeeManagementStore.self) private var employeeManagementStore
    
    var body: some View {
        List {
            Section("Orders") {
                // OrderListView(orders: orderingStore.orders)
                ForEach(orderingStore.orders) { order in
                    Text(order.name)
                }
            }
            
            Section("Employees") {
                // EmployeeListView(employees: employeeManagementStore.employees)
                ForEach(employeeManagementStore.employees) { employee in
                    Text(employee.name)
                }
            }
        }
    }
}

#Preview {
    EmployeeManagementScreen()
        .environment(EmployeeManagementStore())
        .environment(OrderingStore(httpClient: HTTPClient()))
}
