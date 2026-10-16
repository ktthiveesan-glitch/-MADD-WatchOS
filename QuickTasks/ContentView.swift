import SwiftUI

struct ContentView: View {

    // Part B – at least four initial tasks stored with @State
    @State private var tasks = [
        TaskItem(title: "Morning Walk", completed: true),
        TaskItem(title: "Drink Water", completed: false),
        TaskItem(title: "Read Notes", completed: false),
        TaskItem(title: "Call Home", completed: true)
    ]

    // Part E – completion count using filter
    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    var body: some View {

        NavigationStack {

            List {

                // Header: completion count
                Section {
                    VStack(spacing: 4) {
                        Text("\(completedCount) / \(tasks.count) Completed")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity)
                    .listRowBackground(Color.clear)
                }

                // Part D – tap a task to toggle its status
                Section("Tap to complete") {
                    ForEach(tasks.indices, id: \.self) { index in
                        Button {
                            tasks[index].completed.toggle()
                        } label: {
                            HStack {
                                Image(
                                    systemName: tasks[index].completed
                                        ? "checkmark.circle.fill"
                                        : "circle"
                                )
                                .foregroundStyle(tasks[index].completed ? .green : .secondary)

                                Text(tasks[index].title)
                                    .strikethrough(tasks[index].completed)

                                Spacer()
                            }
                        }
                    }
                }

                // Part F – separate, clearly labelled navigation to details
                Section("Details") {
                    ForEach(tasks) { task in
                        NavigationLink {
                            TaskDetailView(task: task)
                        } label: {
                            Label(task.title, systemImage: "info.circle")
                        }
                    }
                }

                // Part G – Option A: Reset Tasks
                Section {
                    Button(role: .destructive) {
                        for index in tasks.indices {
                            tasks[index].completed = false
                        }
                    } label: {
                        Label("Reset Tasks", systemImage: "arrow.counterclockwise")
                    }
                }
            }
            .navigationTitle("Quick Tasks")
        }
    }
}

#Preview {
    ContentView()
}
