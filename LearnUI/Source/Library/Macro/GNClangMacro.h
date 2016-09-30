//
//  GNClangMacro.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/11/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#define GNClangDiagnosticPush _Pragma("clang diagnostic push")
#define GNClangDiagnosticPop _Pragma("clang diagnostic pop")

#define GNClangDiagnosticPushOption(option) \
    GNClangDiagnosticPush \
    _Pragma(option)

#define GNClangDiagnosticPopOption GNClangDiagnosticPop

#define GNClangDiagnosticPushOptionPerformSelectorLeakWarning \
GNClangDiagnosticPushOption("clang diagnostic ignored \"-Warc-performSelector-leaks\"")
