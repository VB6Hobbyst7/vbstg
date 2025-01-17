VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "LinearBullet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Implements IBullet

Public Position As New Point
Public Speed As New Point
Public Size As Double
Private IsGrazed As Boolean

Private Sub Class_Initialize()
    Size = 5
End Sub

Private Function IBullet_IsAlive() As Boolean
    With Position
        IBullet_IsAlive = _
            .X > -Size And .Y > -Size And _
            .X < GameWidth + Size And .Y < GameHeight + Size
    End With
End Function

Private Function IBullet_IsGrazed() As Boolean
    IBullet_IsGrazed = IsGrazed
End Function

Private Sub IBullet_SetGrazed()
    IsGrazed = True
End Sub

Public Sub IBullet_Update(ByVal TimeDiff As Double)
    Position.X = Position.X + TimeDiff * Speed.X
    Position.Y = Position.Y + TimeDiff * Speed.Y
End Sub

Public Function IBullet_GetPosition() As Point
    Set IBullet_GetPosition = Position
End Function

Public Function IBullet_GetSize() As Double
    IBullet_GetSize = Size
End Function
