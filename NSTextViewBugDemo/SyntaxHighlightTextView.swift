//
//  SyntaxHighlightTextView.swift
//  NSTextViewBugDemo
//
//  Created by Victor Teo on 2026/5/11.
//

import AppKit

class SyntaxHighlightTextView: NSTextView {

    override var string: String {
        didSet {
            rehighlight()
        }
    }

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        afterInit()
    }

    override init(frame frameRect: NSRect, textContainer container: NSTextContainer?) {
        super.init(frame: frameRect, textContainer: container)
        afterInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("not supported")
    }

    private func afterInit() {
        guard let textStorage else { return }
        textStorage.delegate = self
    }
}

extension SyntaxHighlightTextView: NSTextStorageDelegate {
    func textStorage(
        _ textStorage: NSTextStorage,
        didProcessEditing editedMask: NSTextStorageEditActions,
        range editedRange: NSRange,
        changeInLength delta: Int
    ) {
        if editedMask.contains(.editedCharacters) {
            //rehighlight()
        }
    }
}

extension SyntaxHighlightTextView {

    private func rehighlight() {
        guard let textStorage else { return }
        let color = NSColor.red
        textStorage.setAttributes([
            .foregroundColor: color
        ], range: NSRange(location: 0, length: textStorage.length))
    }
}
