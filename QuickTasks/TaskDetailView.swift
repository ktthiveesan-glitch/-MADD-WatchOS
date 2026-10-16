import SwiftUI

struct TaskDetailView: View {

    let task: TaskItem

    var body: some View {

        VStack(spacing: 10) {

            Image(
                systemName: task.completed
                    ? "checkmark.circle.fill"
                    : "circle"
            )
            .font(.largeTitle)
            .foregroundStyle(task.completed ? .green : .secondary)

            Text(task.title)
                .font(.headline)
                .multilineTextAlignment(.center)

            Text(task.completed ? "Completed" : "Pending")
                .font(.caption)
                .foregroundStyle(task.completed ? .green : .orange)
        }
        .navigationTitle("Details")
    }
}

#Preview {
    TaskDetailView(task: TaskItem(title: "Morning Walk", completed: true))
}
