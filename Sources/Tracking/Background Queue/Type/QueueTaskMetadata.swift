import Foundation

/// Pointer to full queue task in persistent storage.
/// This data structure is meant to be as small as possible with the
/// ability to hold all queue task metadata in memory at runtime.
public struct QueueTaskMetadata: Codable, Equatable, AutoLenses {
    let taskPersistedId: String
    let taskType: String
    /// The start of a new group of tasks.
    /// Tasks can be the start of of 0 or 1 groups
    let groupStart: String?
    /// Groups that this task belongs to.
    /// Tasks can belong to 0+ groups
    let groupMember: [String]?
}

internal extension QueueTaskMetadata {
    static var random: QueueTaskMetadata {
        QueueTaskMetadata(taskPersistedId: String.random,
                          taskType: QueueTaskType.trackEvent.rawValue,
                          groupStart: nil,
                          groupMember: nil)
    }
}