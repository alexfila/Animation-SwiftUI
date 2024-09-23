//
//  TemplateList.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

struct TemplateList: View {
    var contentSource: [Template]

    @State private var selection: Destination?
    
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                ForEach(contentSource) { row in
                    TemplateRowView(title: row.title, description: row.description, icon: row.symbol)
                        .tag(row.destination)
                }
            }
            .navigationTitle("Templates")
            .navigationBarTitleDisplayMode(.large)
        } detail: {
            if let selection {
                Destination.view(forSelection: selection)
            } else {
                Text("Select a Template Example")
                    .foregroundColor(.secondary)
            }
        }
    }
    
}

struct TopicList_Previews: PreviewProvider {
    static var previews: some View {
        TemplateList(contentSource: TemplateData.homeContent)
    }
}

