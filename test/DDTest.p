ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING OpenEdge.Core.Assert.

{ DataDigger.i }

@Test.
PROCEDURE TestCreateFolder:
    DEFINE VARIABLE lib AS HANDLE      NO-UNDO.
    RUN dataDiggerLib.p PERSISTENT SET lib.
    RUN getTables IN lib (INPUT TABLE ttTableFilter, OUTPUT TABLE ttTable).

    DEFINE VARIABLE cErr AS CHARACTER   NO-UNDO.
    RUN createFolder IN lib (INPUT '.\dir1\dir2\dir3').

    FILE-INFO:FILE-NAME = "dir1".
    Assert:IsTrue(INDEX(FILE-INFO:FILE-TYPE, "D") GT 0).
    FILE-INFO:FILE-NAME = "dir1/dir2".
    Assert:IsTrue(INDEX(FILE-INFO:FILE-TYPE, "D") GT 0).
    FILE-INFO:FILE-NAME = "dir1/dir2/dirss3".
    Assert:IsTrue(INDEX(FILE-INFO:FILE-TYPE, "D") GT 0).

    DELETE PROCEDURE lib.

END PROCEDURE
