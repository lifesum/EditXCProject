import EditXCProjectCore

let tool = EditXCProject()

do {
    try tool.run()
} catch {
    print("An error occurred: \(error)")
}
