//
//  TemplateRowView.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

struct TemplateRowView: View {
    var title : String
    var description: String
    var icon : String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.accentColor)
                .frame(minWidth: 30, minHeight: 20)
                .padding(.trailing, 4)
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(Font.system(size: 20.0, weight: .semibold, design: .default))
                    .padding(.bottom, 4)
                Text(description)
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
        .frame(minHeight: 60)
    }
}

struct TemplateRowView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateRowView(title: "Template example", description: "Description of template animation", icon: "rectangle.fill")
    }
}
