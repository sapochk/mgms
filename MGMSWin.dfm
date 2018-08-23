object MainForm: TMainForm
  Left = 361
  Top = 110
  Width = 818
  Height = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object MainControl: TPageControl
    Left = 0
    Top = 0
    Width = 810
    Height = 508
    ActivePage = CalibrationSheet
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabIndex = 1
    TabOrder = 0
    OnChanging = MainControlChanging
    object MeasurementSheet: TTabSheet
      Caption = 'Measurement'
      object FrontPanel: TPanel
        Left = 0
        Top = 108
        Width = 802
        Height = 90
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object LGageBox1: TGroupBox
          Left = 1
          Top = 1
          Width = 240
          Height = 88
          Align = alLeft
          Caption = 'Left Gage'
          Color = clBtnFace
          Enabled = False
          ParentColor = False
          TabOrder = 0
          object LFilteredGage: TAdvEdit
            Tag = 1
            Left = 70
            Top = 18
            Width = 149
            Height = 21
            AutoFocus = False
            EditAlign = eaLeft
            EditType = etString
            ErrorMarkerPos = 0
            ErrorMarkerLen = 0
            ErrorColor = clRed
            ErrorFontColor = clWhite
            ExcelStyleDecimalSeparator = False
            Flat = False
            FlatLineColor = clBlack
            FlatParentColor = True
            FocusAlign = eaDefault
            FocusBorder = False
            FocusColor = clWindow
            FocusFontColor = clWindowText
            FocusLabel = False
            FocusWidthInc = 0
            ModifiedColor = clHighlight
            DisabledColor = clWindow
            URLColor = clBlue
            ReturnIsTab = False
            LengthLimit = 0
            TabOnFullLength = False
            Precision = 0
            LabelCaption = 'Filtered'
            LabelPosition = lpLeftCenter
            LabelMargin = 4
            LabelTransparent = False
            LabelAlwaysEnabled = False
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            Lookup.CaseSensitive = False
            Lookup.Color = clWindow
            Lookup.DisplayCount = 4
            Lookup.Enabled = False
            Lookup.History = False
            Lookup.NumChars = 2
            Lookup.Multi = False
            Lookup.Separator = ';'
            Persistence.Enable = False
            Persistence.Location = plInifile
            Color = clWindow
            Enabled = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HintShowLargeText = False
            ParentFont = False
            OleDropTarget = False
            OleDropSource = False
            ReadOnly = True
            Signed = False
            TabOrder = 0
            Text = '0'
            Transparent = False
            Visible = True
            Version = '2.6.2.1'
          end
          object LInstantGage: TAdvEdit
            Tag = 1
            Left = 70
            Top = 48
            Width = 149
            Height = 21
            AutoFocus = False
            EditAlign = eaLeft
            EditType = etString
            ErrorMarkerPos = 0
            ErrorMarkerLen = 0
            ErrorColor = clRed
            ErrorFontColor = clWhite
            ExcelStyleDecimalSeparator = False
            Flat = False
            FlatLineColor = clBlack
            FlatParentColor = True
            FocusAlign = eaDefault
            FocusBorder = False
            FocusColor = clWindow
            FocusFontColor = clWindowText
            FocusLabel = False
            FocusWidthInc = 0
            ModifiedColor = clHighlight
            DisabledColor = clWindow
            URLColor = clBlue
            ReturnIsTab = False
            LengthLimit = 0
            TabOnFullLength = False
            Precision = 0
            LabelCaption = 'Instant'
            LabelPosition = lpLeftCenter
            LabelMargin = 4
            LabelTransparent = False
            LabelAlwaysEnabled = False
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            Lookup.CaseSensitive = False
            Lookup.Color = clWindow
            Lookup.DisplayCount = 4
            Lookup.Enabled = False
            Lookup.History = False
            Lookup.NumChars = 2
            Lookup.Multi = False
            Lookup.Separator = ';'
            Persistence.Enable = False
            Persistence.Location = plInifile
            Color = clWindow
            Enabled = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HintShowLargeText = False
            ParentFont = False
            OleDropTarget = False
            OleDropSource = False
            ReadOnly = True
            Signed = False
            TabOrder = 1
            Text = '0'
            Transparent = False
            Visible = False
            Version = '2.6.2.1'
          end
        end
        object GageBox1: TGroupBox
          Left = 241
          Top = 1
          Width = 301
          Height = 88
          Align = alLeft
          Enabled = False
          TabOrder = 1
          object TotalGage0: TAdvEdit
            Left = 113
            Top = 12
            Width = 109
            Height = 21
            AutoFocus = False
            EditAlign = eaLeft
            EditType = etString
            ErrorMarkerPos = 0
            ErrorMarkerLen = 0
            ErrorColor = clRed
            ErrorFontColor = clWhite
            ExcelStyleDecimalSeparator = False
            Flat = False
            FlatLineColor = clBlack
            FlatParentColor = True
            FocusAlign = eaDefault
            FocusBorder = False
            FocusColor = clWindow
            FocusFontColor = clWindowText
            FocusLabel = False
            FocusWidthInc = 0
            ModifiedColor = clHighlight
            DisabledColor = clWindow
            URLColor = clBlue
            ReturnIsTab = False
            LengthLimit = 0
            TabOnFullLength = False
            Precision = 0
            LabelCaption = 'Total Gage'
            LabelPosition = lpLeftCenter
            LabelMargin = 4
            LabelTransparent = False
            LabelAlwaysEnabled = False
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            Lookup.CaseSensitive = False
            Lookup.Color = clWindow
            Lookup.DisplayCount = 4
            Lookup.Enabled = False
            Lookup.History = False
            Lookup.NumChars = 2
            Lookup.Multi = False
            Lookup.Separator = ';'
            Persistence.Enable = False
            Persistence.Location = plInifile
            Color = clWindow
            Enabled = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HintShowLargeText = False
            ParentFont = False
            OleDropTarget = False
            OleDropSource = False
            ReadOnly = True
            Signed = False
            TabOrder = 0
            Text = '0'
            Transparent = False
            Visible = True
            Version = '2.6.2.1'
          end
        end
        object RGageBox1: TGroupBox
          Left = 542
          Top = 1
          Width = 259
          Height = 88
          Align = alClient
          Caption = 'Right Gage'
          Enabled = False
          TabOrder = 2
          object RFilteredGage: TAdvEdit
            Left = 70
            Top = 18
            Width = 149
            Height = 21
            AutoFocus = False
            EditAlign = eaLeft
            EditType = etString
            ErrorMarkerPos = 0
            ErrorMarkerLen = 0
            ErrorColor = clRed
            ErrorFontColor = clWhite
            ExcelStyleDecimalSeparator = False
            Flat = False
            FlatLineColor = clBlack
            FlatParentColor = True
            FocusAlign = eaDefault
            FocusBorder = False
            FocusColor = clWindow
            FocusFontColor = clWindowText
            FocusLabel = False
            FocusWidthInc = 0
            ModifiedColor = clHighlight
            DisabledColor = clWindow
            URLColor = clBlue
            ReturnIsTab = False
            LengthLimit = 0
            TabOnFullLength = False
            Precision = 0
            LabelCaption = 'Filtered'
            LabelPosition = lpLeftCenter
            LabelMargin = 4
            LabelTransparent = False
            LabelAlwaysEnabled = True
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            Lookup.CaseSensitive = False
            Lookup.Color = clWindow
            Lookup.DisplayCount = 4
            Lookup.Enabled = False
            Lookup.History = False
            Lookup.NumChars = 2
            Lookup.Multi = False
            Lookup.Separator = ';'
            Persistence.Enable = False
            Persistence.Location = plInifile
            Color = clWindow
            Enabled = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HintShowLargeText = False
            ParentFont = False
            OleDropTarget = False
            OleDropSource = False
            ReadOnly = True
            Signed = False
            TabOrder = 0
            Text = '0'
            Transparent = False
            Visible = True
            Version = '2.6.2.1'
          end
          object RInstantGage: TAdvEdit
            Left = 70
            Top = 48
            Width = 149
            Height = 21
            AutoFocus = False
            EditAlign = eaLeft
            EditType = etString
            ErrorMarkerPos = 0
            ErrorMarkerLen = 0
            ErrorColor = clRed
            ErrorFontColor = clWhite
            ExcelStyleDecimalSeparator = False
            Flat = False
            FlatLineColor = clBlack
            FlatParentColor = True
            FocusAlign = eaDefault
            FocusBorder = False
            FocusColor = clWindow
            FocusFontColor = clWindowText
            FocusLabel = False
            FocusWidthInc = 0
            ModifiedColor = clHighlight
            DisabledColor = clWindow
            URLColor = clBlue
            ReturnIsTab = False
            LengthLimit = 0
            TabOnFullLength = False
            Precision = 0
            LabelCaption = 'Instant'
            LabelPosition = lpLeftCenter
            LabelMargin = 4
            LabelTransparent = False
            LabelAlwaysEnabled = False
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            Lookup.CaseSensitive = False
            Lookup.Color = clWindow
            Lookup.DisplayCount = 4
            Lookup.Enabled = False
            Lookup.History = False
            Lookup.NumChars = 2
            Lookup.Multi = False
            Lookup.Separator = ';'
            Persistence.Enable = False
            Persistence.Location = plInifile
            Color = clWindow
            Enabled = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HintShowLargeText = False
            ParentFont = False
            OleDropTarget = False
            OleDropSource = False
            ReadOnly = True
            Signed = False
            TabOrder = 1
            Text = '0'
            Transparent = False
            Visible = False
            Version = '2.6.2.1'
          end
        end
      end
      object RearPanel: TPanel
        Left = 0
        Top = 198
        Width = 802
        Height = 90
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object LGageBox2: TGroupBox
          Left = 1
          Top = 1
          Width = 240
          Height = 88
          Align = alLeft
          Caption = 'Left Gage'
          Enabled = False
          TabOrder = 0
          object LFilteredGage1: TAdvEdit
            Tag = 3
            Left = 70
            Top = 18
            Width = 149
            Height = 21
            AutoFocus = False
            EditAlign = eaLeft
            EditType = etString
            ErrorMarkerPos = 0
            ErrorMarkerLen = 0
            ErrorColor = clRed
            ErrorFontColor = clWhite
            ExcelStyleDecimalSeparator = False
            Flat = False
            FlatLineColor = clBlack
            FlatParentColor = True
            FocusAlign = eaDefault
            FocusBorder = False
            FocusColor = clWindow
            FocusFontColor = clWindowText
            FocusLabel = False
            FocusWidthInc = 0
            ModifiedColor = clHighlight
            DisabledColor = clWindow
            URLColor = clBlue
            ReturnIsTab = False
            LengthLimit = 0
            TabOnFullLength = False
            Precision = 0
            LabelCaption = 'Filtered'
            LabelPosition = lpLeftCenter
            LabelMargin = 4
            LabelTransparent = False
            LabelAlwaysEnabled = False
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            Lookup.CaseSensitive = False
            Lookup.Color = clWindow
            Lookup.DisplayCount = 4
            Lookup.Enabled = False
            Lookup.History = False
            Lookup.NumChars = 2
            Lookup.Multi = False
            Lookup.Separator = ';'
            Persistence.Enable = False
            Persistence.Location = plInifile
            Color = clWindow
            Enabled = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HintShowLargeText = False
            ParentFont = False
            OleDropTarget = False
            OleDropSource = False
            ReadOnly = True
            Signed = False
            TabOrder = 0
            Text = '0'
            Transparent = False
            Visible = True
            Version = '2.6.2.1'
          end
          object LInstantGage1: TAdvEdit
            Tag = 3
            Left = 70
            Top = 48
            Width = 149
            Height = 21
            AutoFocus = False
            EditAlign = eaLeft
            EditType = etString
            ErrorMarkerPos = 0
            ErrorMarkerLen = 0
            ErrorColor = clRed
            ErrorFontColor = clWhite
            ExcelStyleDecimalSeparator = False
            Flat = False
            FlatLineColor = clBlack
            FlatParentColor = True
            FocusAlign = eaDefault
            FocusBorder = False
            FocusColor = clWindow
            FocusFontColor = clWindowText
            FocusLabel = False
            FocusWidthInc = 0
            ModifiedColor = clHighlight
            DisabledColor = clWindow
            URLColor = clBlue
            ReturnIsTab = False
            LengthLimit = 0
            TabOnFullLength = False
            Precision = 0
            LabelCaption = 'Instant'
            LabelPosition = lpLeftCenter
            LabelMargin = 4
            LabelTransparent = False
            LabelAlwaysEnabled = False
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            Lookup.CaseSensitive = False
            Lookup.Color = clWindow
            Lookup.DisplayCount = 4
            Lookup.Enabled = False
            Lookup.History = False
            Lookup.NumChars = 2
            Lookup.Multi = False
            Lookup.Separator = ';'
            Persistence.Enable = False
            Persistence.Location = plInifile
            Color = clWindow
            Enabled = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HintShowLargeText = False
            ParentFont = False
            OleDropTarget = False
            OleDropSource = False
            ReadOnly = True
            Signed = False
            TabOrder = 1
            Text = '0'
            Transparent = False
            Visible = False
            Version = '2.6.2.1'
          end
        end
        object GageBox2: TGroupBox
          Left = 241
          Top = 1
          Width = 301
          Height = 88
          Align = alLeft
          Enabled = False
          TabOrder = 1
          object TotalGage1: TAdvEdit
            Tag = 1
            Left = 113
            Top = 12
            Width = 110
            Height = 21
            AutoFocus = False
            EditAlign = eaLeft
            EditType = etString
            ErrorMarkerPos = 0
            ErrorMarkerLen = 0
            ErrorColor = clRed
            ErrorFontColor = clWhite
            ExcelStyleDecimalSeparator = False
            Flat = False
            FlatLineColor = clBlack
            FlatParentColor = True
            FocusAlign = eaDefault
            FocusBorder = False
            FocusColor = clWindow
            FocusFontColor = clWindowText
            FocusLabel = False
            FocusWidthInc = 0
            ModifiedColor = clHighlight
            DisabledColor = clWindow
            URLColor = clBlue
            ReturnIsTab = False
            LengthLimit = 0
            TabOnFullLength = False
            Precision = 0
            LabelCaption = 'Total Gage'
            LabelPosition = lpLeftCenter
            LabelMargin = 4
            LabelTransparent = False
            LabelAlwaysEnabled = False
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            Lookup.CaseSensitive = False
            Lookup.Color = clWindow
            Lookup.DisplayCount = 4
            Lookup.Enabled = False
            Lookup.History = False
            Lookup.NumChars = 2
            Lookup.Multi = False
            Lookup.Separator = ';'
            Persistence.Enable = False
            Persistence.Location = plInifile
            Color = clWindow
            Enabled = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HintShowLargeText = False
            ParentFont = False
            OleDropTarget = False
            OleDropSource = False
            ReadOnly = True
            Signed = False
            TabOrder = 0
            Text = '0'
            Transparent = False
            Visible = True
            Version = '2.6.2.1'
          end
        end
        object RGageBox2: TGroupBox
          Left = 542
          Top = 1
          Width = 259
          Height = 88
          Align = alClient
          Caption = 'Right Gage'
          Enabled = False
          TabOrder = 2
          object RFilteredGage1: TAdvEdit
            Tag = 2
            Left = 70
            Top = 18
            Width = 149
            Height = 21
            AutoFocus = False
            EditAlign = eaLeft
            EditType = etString
            ErrorMarkerPos = 0
            ErrorMarkerLen = 0
            ErrorColor = clRed
            ErrorFontColor = clWhite
            ExcelStyleDecimalSeparator = False
            Flat = False
            FlatLineColor = clBlack
            FlatParentColor = True
            FocusAlign = eaDefault
            FocusBorder = False
            FocusColor = clWindow
            FocusFontColor = clWindowText
            FocusLabel = False
            FocusWidthInc = 0
            ModifiedColor = clHighlight
            DisabledColor = clWindow
            URLColor = clBlue
            ReturnIsTab = False
            LengthLimit = 0
            TabOnFullLength = False
            Precision = 0
            LabelCaption = 'Filtered'
            LabelPosition = lpLeftCenter
            LabelMargin = 4
            LabelTransparent = False
            LabelAlwaysEnabled = True
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            Lookup.CaseSensitive = False
            Lookup.Color = clWindow
            Lookup.DisplayCount = 4
            Lookup.Enabled = False
            Lookup.History = False
            Lookup.NumChars = 2
            Lookup.Multi = False
            Lookup.Separator = ';'
            Persistence.Enable = False
            Persistence.Location = plInifile
            Color = clWindow
            Enabled = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HintShowLargeText = False
            ParentFont = False
            OleDropTarget = False
            OleDropSource = False
            ReadOnly = True
            Signed = False
            TabOrder = 0
            Text = '0'
            Transparent = False
            Visible = True
            Version = '2.6.2.1'
          end
          object RInstantGage1: TAdvEdit
            Tag = 2
            Left = 70
            Top = 48
            Width = 149
            Height = 21
            AutoFocus = False
            EditAlign = eaLeft
            EditType = etString
            ErrorMarkerPos = 0
            ErrorMarkerLen = 0
            ErrorColor = clRed
            ErrorFontColor = clWhite
            ExcelStyleDecimalSeparator = False
            Flat = False
            FlatLineColor = clBlack
            FlatParentColor = True
            FocusAlign = eaDefault
            FocusBorder = False
            FocusColor = clWindow
            FocusFontColor = clWindowText
            FocusLabel = False
            FocusWidthInc = 0
            ModifiedColor = clHighlight
            DisabledColor = clWindow
            URLColor = clBlue
            ReturnIsTab = False
            LengthLimit = 0
            TabOnFullLength = False
            Precision = 0
            LabelCaption = 'Instant'
            LabelPosition = lpLeftCenter
            LabelMargin = 4
            LabelTransparent = False
            LabelAlwaysEnabled = False
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            Lookup.CaseSensitive = False
            Lookup.Color = clWindow
            Lookup.DisplayCount = 4
            Lookup.Enabled = False
            Lookup.History = False
            Lookup.NumChars = 2
            Lookup.Multi = False
            Lookup.Separator = ';'
            Persistence.Enable = False
            Persistence.Location = plInifile
            Color = clWindow
            Enabled = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HintShowLargeText = False
            ParentFont = False
            OleDropTarget = False
            OleDropSource = False
            ReadOnly = True
            Signed = False
            TabOrder = 1
            Text = '0'
            Transparent = False
            Visible = False
            Version = '2.6.2.1'
          end
        end
      end
      object StatusPanel: TPanel
        Left = 0
        Top = 0
        Width = 802
        Height = 108
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object EM1ConnectionBox: TGroupBox
          Left = 5
          Top = 1
          Width = 192
          Height = 57
          Caption = 'EM1 Connection Status'
          TabOrder = 0
          object EM1ConnectionLabel: TLEDLabel
            Left = 9
            Top = 16
            Width = 139
            Height = 15
            Lit = True
            Color = lcYellow
            Caption = 'Not Connected'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object ClearMessagesBtn: TButton
          Left = 486
          Top = 9
          Width = 165
          Height = 45
          Caption = 'Clear Messages'
          TabOrder = 1
          Visible = False
          OnClick = ClearMessagesBtnClick
        end
        object ApplanixConnectionBox: TGroupBox
          Left = 206
          Top = 1
          Width = 272
          Height = 57
          Caption = 'Applanix Connection Status'
          TabOrder = 2
          object ADCConnectionLabel: TLEDLabel
            Left = 9
            Top = 16
            Width = 208
            Height = 15
            Lit = True
            Color = lcYellow
            Caption = 'GAGE Data Not Connected'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object PPSConnectionLabel: TLEDLabel
            Left = 9
            Top = 34
            Width = 208
            Height = 15
            Lit = True
            Color = lcYellow
            Caption = 'PPS Not Connected'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object adcDataBreaksBox: TGroupBox
          Left = 4
          Top = 59
          Width = 230
          Height = 44
          Caption = 'adc Data Breaks'
          Enabled = False
          TabOrder = 3
          object adcInterrupt: TLabel
            Left = 9
            Top = 17
            Width = 9
            Height = 16
            Caption = '0'
          end
          object MissingADCDatabreaksEd: TAdvEdit
            Left = 160
            Top = 12
            Width = 60
            Height = 21
            AutoFocus = False
            EditAlign = eaLeft
            EditType = etString
            ErrorMarkerPos = 0
            ErrorMarkerLen = 0
            ErrorColor = clRed
            ErrorFontColor = clWhite
            ExcelStyleDecimalSeparator = False
            Flat = False
            FlatLineColor = clBlack
            FlatParentColor = True
            FocusAlign = eaDefault
            FocusBorder = False
            FocusColor = clWindow
            FocusFontColor = clWindowText
            FocusLabel = False
            FocusWidthInc = 0
            ModifiedColor = clHighlight
            DisabledColor = clWindow
            URLColor = clBlue
            ReturnIsTab = False
            LengthLimit = 0
            TabOnFullLength = False
            Precision = 0
            LabelCaption = 'Missing'
            LabelPosition = lpLeftCenter
            LabelMargin = 4
            LabelTransparent = False
            LabelAlwaysEnabled = False
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            Lookup.CaseSensitive = False
            Lookup.Color = clWindow
            Lookup.DisplayCount = 4
            Lookup.Enabled = False
            Lookup.History = False
            Lookup.NumChars = 2
            Lookup.Multi = False
            Lookup.Separator = ';'
            Persistence.Enable = False
            Persistence.Location = plInifile
            Color = clWindow
            Enabled = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HintShowLargeText = False
            ParentFont = False
            OleDropTarget = False
            OleDropSource = False
            ReadOnly = True
            Signed = False
            TabOrder = 0
            Text = '0'
            Transparent = False
            Visible = True
            Version = '2.6.2.1'
          end
        end
        object ppsDataBreakBox: TGroupBox
          Left = 239
          Top = 59
          Width = 230
          Height = 43
          Caption = 'pps Data Breaks'
          Enabled = False
          TabOrder = 4
          object ppsInterrupt: TLabel
            Left = 9
            Top = 17
            Width = 9
            Height = 16
            Caption = '0'
          end
          object MissingPPSDatabreaksEd: TAdvEdit
            Left = 160
            Top = 11
            Width = 60
            Height = 21
            AutoFocus = False
            EditAlign = eaLeft
            EditType = etString
            ErrorMarkerPos = 0
            ErrorMarkerLen = 0
            ErrorColor = clRed
            ErrorFontColor = clWhite
            ExcelStyleDecimalSeparator = False
            Flat = False
            FlatLineColor = clBlack
            FlatParentColor = True
            FocusAlign = eaDefault
            FocusBorder = False
            FocusColor = clWindow
            FocusFontColor = clWindowText
            FocusLabel = False
            FocusWidthInc = 0
            ModifiedColor = clHighlight
            DisabledColor = clWindow
            URLColor = clBlue
            ReturnIsTab = False
            LengthLimit = 0
            TabOnFullLength = False
            Precision = 0
            LabelCaption = 'Missing'
            LabelPosition = lpLeftCenter
            LabelMargin = 4
            LabelTransparent = False
            LabelAlwaysEnabled = False
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            Lookup.CaseSensitive = False
            Lookup.Color = clWindow
            Lookup.DisplayCount = 4
            Lookup.Enabled = False
            Lookup.History = False
            Lookup.NumChars = 2
            Lookup.Multi = False
            Lookup.Separator = ';'
            Persistence.Enable = False
            Persistence.Location = plInifile
            Color = clWindow
            Enabled = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            HintShowLargeText = False
            ParentFont = False
            OleDropTarget = False
            OleDropSource = False
            ReadOnly = True
            Signed = False
            TabOrder = 0
            Text = '0'
            Transparent = False
            Visible = True
            Version = '2.6.2.1'
          end
        end
        object DisplayDataBox: TGroupBox
          Left = 478
          Top = 59
          Width = 204
          Height = 42
          TabOrder = 5
          object DisplayCountersCB: TCheckBox
            Left = 12
            Top = 14
            Width = 176
            Height = 20
            Caption = 'Display Counters'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
        end
      end
      object CalibrateBtn: TButton
        Left = 2
        Top = 302
        Width = 164
        Height = 32
        Caption = 'Start Calibration'
        TabOrder = 3
        OnClick = CalibrateBtnClick
      end
    end
    object CalibrationSheet: TTabSheet
      Caption = 'Calibration'
      ImageIndex = 1
      object CalibrationControlPanel: TPanel
        Left = 0
        Top = 0
        Width = 802
        Height = 44
        Align = alTop
        TabOrder = 0
        object EndCalibrationBtn: TButton
          Left = 462
          Top = 7
          Width = 163
          Height = 32
          Caption = 'Finish Calibration'
          TabOrder = 0
          OnClick = EndCalibrationBtnClick
        end
        object CalibrateToolBar: TToolBar
          Left = 1
          Top = 1
          Width = 446
          Height = 34
          Align = alNone
          AutoSize = True
          ButtonHeight = 30
          ButtonWidth = 31
          Caption = 'CalibrateToolBar'
          Images = ToolIcons
          TabOrder = 1
          object SaveBtn: TToolButton
            Left = 0
            Top = 2
            Hint = 'Save Configuration'
            Caption = 'SaveBtn'
            Enabled = False
            ImageIndex = 0
            ParentShowHint = False
            ShowHint = True
            OnClick = SaveBtnClick
          end
          object ToolButton2: TToolButton
            Left = 31
            Top = 2
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 1
            Style = tbsSeparator
          end
          object ReadBtn: TToolButton
            Left = 39
            Top = 2
            Caption = 'ReadBtn'
            ImageIndex = 1
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object ToolButton4: TToolButton
            Left = 70
            Top = 2
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 2
            Style = tbsSeparator
            Visible = False
          end
          object ToolButton5: TToolButton
            Left = 78
            Top = 2
            Caption = 'ToolButton5'
            ImageIndex = 2
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object ToolButton6: TToolButton
            Left = 109
            Top = 2
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 3
            Style = tbsSeparator
            Visible = False
          end
          object CalculateZeroBtn: TToolButton
            Left = 117
            Top = 2
            Hint = 'Calculate Zero'
            Caption = 'CalculateZeroBtn'
            ImageIndex = 3
            ParentShowHint = False
            ShowHint = True
            Visible = False
            OnClick = CalculateZeroBtnClick
          end
          object ToolButton8: TToolButton
            Left = 148
            Top = 2
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 4
            Style = tbsSeparator
          end
          object ToolButton9: TToolButton
            Left = 156
            Top = 2
            Caption = 'ToolButton9'
            ImageIndex = 4
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object ToolButton10: TToolButton
            Left = 187
            Top = 2
            Width = 8
            Caption = 'ToolButton10'
            ImageIndex = 5
            Style = tbsSeparator
            Visible = False
          end
          object CalculateGainBtn: TToolButton
            Left = 195
            Top = 2
            Hint = 'Calculate Gain'
            Caption = 'CalculateGainBtn'
            ImageIndex = 5
            ParentShowHint = False
            ShowHint = True
            Visible = False
            OnClick = CalculateGainBtnClick
          end
          object ToolButton12: TToolButton
            Left = 226
            Top = 2
            Width = 8
            Caption = 'ToolButton12'
            ImageIndex = 6
            Style = tbsSeparator
          end
          object StartPollingBtn: TToolButton
            Left = 234
            Top = 2
            Hint = 'Start Polling'
            Caption = 'StartPollingBtn'
            ImageIndex = 6
            ParentShowHint = False
            ShowHint = True
            OnClick = StartPollingBtnClick
          end
          object ToolButton14: TToolButton
            Left = 265
            Top = 2
            Width = 8
            Caption = 'ToolButton14'
            ImageIndex = 7
            Style = tbsSeparator
          end
          object StopPollingBtn: TToolButton
            Left = 273
            Top = 2
            Hint = 'Stop Polling'
            Caption = 'StopPollingBtn'
            Enabled = False
            ImageIndex = 7
            ParentShowHint = False
            ShowHint = True
            OnClick = StopPollingBtnClick
          end
          object ToolButton16: TToolButton
            Left = 304
            Top = 2
            Width = 8
            Caption = 'ToolButton16'
            ImageIndex = 8
            Style = tbsSeparator
          end
          object EnableEditBtn: TToolButton
            Left = 312
            Top = 2
            Hint = 'Enable/Disable Direct Editing'
            Caption = 'EnableEditBtn'
            ImageIndex = 8
            ParentShowHint = False
            ShowHint = True
            OnClick = EnableEditBtnClick
          end
          object ToolButton18: TToolButton
            Left = 343
            Top = 2
            Width = 8
            Caption = 'ToolButton18'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object EditLed: TALed
            Left = 351
            Top = 2
            Width = 25
            Height = 30
            Blink = False
            Interval = 500
          end
          object ToolButton19: TToolButton
            Left = 376
            Top = 2
            Caption = 'ToolButton19'
            ImageIndex = 9
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object ToolButton20: TToolButton
            Left = 407
            Top = 2
            Width = 8
            Caption = 'ToolButton20'
            ImageIndex = 10
            Style = tbsSeparator
            Visible = False
          end
          object ToolButton21: TToolButton
            Left = 415
            Top = 2
            Caption = 'ToolButton21'
            ImageIndex = 10
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
        end
      end
      object GridPanel: TPanel
        Left = 0
        Top = 44
        Width = 802
        Height = 168
        Align = alTop
        TabOrder = 1
        object Grid: TAdvStringGrid
          Left = 1
          Top = 1
          Width = 800
          Height = 166
          Cursor = crDefault
          Align = alClient
          ColCount = 11
          DefaultRowHeight = 21
          DefaultDrawing = False
          FixedCols = 1
          RowCount = 5
          FixedRows = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLineWidth = 1
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          OnSelectCell = GridSelectCell
          GridLineColor = clSilver
          ActiveCellShow = False
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = clGray
          ActiveCellColorTo = clNone
          Bands.Active = True
          Bands.PrimaryColor = clInfoBk
          Bands.PrimaryLength = 1
          Bands.SecondaryColor = clWindow
          Bands.SecondaryLength = 1
          Bands.Print = False
          AutoNumAlign = False
          AutoSize = False
          VAlignment = vtaTop
          EnhTextSize = False
          EnhRowColMove = True
          SizeWithForm = False
          Multilinecells = False
          OnCellValidate = GridCellValidate
          OnGetEditorType = GridGetEditorType
          OnGetEditorProp = GridGetEditorProp
          DragDropSettings.OleAcceptFiles = True
          DragDropSettings.OleAcceptText = True
          SortSettings.AutoColumnMerge = False
          SortSettings.Column = 0
          SortSettings.Show = False
          SortSettings.IndexShow = False
          SortSettings.IndexColor = clYellow
          SortSettings.Full = True
          SortSettings.SingleColumn = False
          SortSettings.IgnoreBlanks = False
          SortSettings.BlankPos = blFirst
          SortSettings.AutoFormat = True
          SortSettings.Direction = sdAscending
          SortSettings.InitSortDirection = sdAscending
          SortSettings.FixedCols = False
          SortSettings.NormalCellsOnly = False
          SortSettings.Row = 0
          SortSettings.UndoSort = False
          FloatingFooter.Color = clBtnFace
          FloatingFooter.Column = 0
          FloatingFooter.FooterStyle = fsFixedLastRow
          FloatingFooter.Visible = False
          ControlLook.Color = clBlack
          ControlLook.CommentColor = clRed
          ControlLook.CheckSize = 15
          ControlLook.RadioSize = 10
          ControlLook.ControlStyle = csWinXP
          ControlLook.DropDownAlwaysVisible = False
          ControlLook.ProgressMarginX = 2
          ControlLook.ProgressMarginY = 2
          EnableBlink = False
          EnableHTML = True
          EnableWheel = True
          Flat = False
          Look = glXP
          HintColor = clInfoBk
          SelectionColor = 15387318
          SelectionTextColor = clBlack
          SelectionRectangle = False
          SelectionResizer = False
          SelectionRTFKeep = False
          HintShowCells = False
          HintShowLargeText = False
          HintShowSizing = False
          PrintSettings.FooterSize = 0
          PrintSettings.HeaderSize = 0
          PrintSettings.Time = ppNone
          PrintSettings.Date = ppNone
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.PageNr = ppNone
          PrintSettings.Title = ppNone
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -11
          PrintSettings.Font.Name = 'MS Sans Serif'
          PrintSettings.Font.Style = []
          PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
          PrintSettings.FixedFont.Color = clWindowText
          PrintSettings.FixedFont.Height = -11
          PrintSettings.FixedFont.Name = 'MS Sans Serif'
          PrintSettings.FixedFont.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'MS Sans Serif'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'MS Sans Serif'
          PrintSettings.FooterFont.Style = []
          PrintSettings.Borders = pbSingle
          PrintSettings.BorderStyle = psSolid
          PrintSettings.Centered = True
          PrintSettings.RepeatFixedRows = False
          PrintSettings.RepeatFixedCols = False
          PrintSettings.LeftSize = 0
          PrintSettings.RightSize = 0
          PrintSettings.ColumnSpacing = 0
          PrintSettings.RowSpacing = 0
          PrintSettings.TitleSpacing = 0
          PrintSettings.Orientation = poPortrait
          PrintSettings.PageNumberOffset = 0
          PrintSettings.MaxPagesOffset = 0
          PrintSettings.FixedWidth = 0
          PrintSettings.FixedHeight = 0
          PrintSettings.UseFixedHeight = False
          PrintSettings.UseFixedWidth = False
          PrintSettings.FitToPage = fpNever
          PrintSettings.PageNumSep = '/'
          PrintSettings.NoAutoSize = False
          PrintSettings.NoAutoSizeRow = False
          PrintSettings.PrintGraphics = False
          PrintSettings.UseDisplayFont = True
          HTMLSettings.Width = 100
          HTMLSettings.XHTML = False
          Navigation.AdvanceDirection = adLeftRight
          Navigation.InsertPosition = pInsertBefore
          Navigation.HomeEndKey = heFirstLastColumn
          Navigation.TabToNextAtEnd = False
          Navigation.TabAdvanceDirection = adLeftRight
          ColumnSize.Location = clRegistry
          CellNode.Color = clSilver
          CellNode.ExpandOne = False
          CellNode.NodeColor = clBlack
          CellNode.NodeIndent = 12
          CellNode.TreeColor = clSilver
          MaxEditLength = 0
          Grouping.HeaderColor = clNone
          Grouping.HeaderColorTo = clNone
          Grouping.HeaderTextColor = clNone
          Grouping.MergeHeader = False
          Grouping.MergeSummary = False
          Grouping.Summary = False
          Grouping.SummaryColor = clNone
          Grouping.SummaryColorTo = clNone
          Grouping.SummaryTextColor = clNone
          IntelliPan = ipVertical
          URLColor = clBlue
          URLShow = False
          URLFull = False
          URLEdit = False
          ScrollType = ssNormal
          ScrollColor = clNone
          ScrollWidth = 16
          ScrollSynch = False
          ScrollProportional = False
          ScrollHints = shNone
          OemConvert = False
          FixedFooters = 0
          FixedRightCols = 0
          FixedColWidth = 58
          FixedRowHeight = 21
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = [fsBold]
          FixedAsButtons = False
          FloatFormat = '%.2f'
          IntegralHeight = False
          WordWrap = True
          ColumnHeaders.Strings = (
            '#'
            'Pol'
            'Name'
            'Volts'
            'Zero'
            'Gain'
            'U/V'
            'CVolts'
            'Total Gage '
            'Offset Gage'
            'Date')
          Lookup = False
          LookupCaseSensitive = False
          LookupHistory = False
          BackGround.Top = 0
          BackGround.Left = 0
          BackGround.Display = bdTile
          BackGround.Cells = bcNormal
          Filter = <>
          Version = '2.8.8.1'
          ColWidths = (
            58
            44
            91
            71
            64
            64
            64
            64
            88
            78
            64)
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 212
        Width = 802
        Height = 265
        Align = alClient
        TabOrder = 2
        object RetractAxleBtn: TTransparentButton
          Left = 181
          Top = 91
          Width = 262
          Height = 25
          AutoGray = False
          Caption = 'Retract Axle'
          FrameStyle = fsRegular
          Transparent = False
          OnClick = RetractAxleBtnClick
        end
        object ExtractAxleBtn: TTransparentButton
          Left = 182
          Top = 124
          Width = 262
          Height = 25
          AutoGray = False
          Caption = 'Extract Axle'
          FrameStyle = fsRegular
          Transparent = False
          OnClick = ExtractAxleBtnClick
        end
        object DifferenceInMMBtn: TTransparentButton
          Left = 183
          Top = 156
          Width = 263
          Height = 25
          AutoGray = False
          Caption = 'Enter Difference in MM'
          FrameStyle = fsRegular
          Transparent = False
          OnClick = DifferenceInMMBtnClick
        end
        object GageOnAxleBtn: TTransparentButton
          Left = 185
          Top = 194
          Width = 262
          Height = 25
          AutoGray = False
          Caption = 'Gage When Axle on Track'
          FrameStyle = fsRegular
          Transparent = False
          OnClick = GageOnAxleBtnClick
        end
        object DiffInMMEd: TAdvEdit
          Left = 87
          Top = 155
          Width = 72
          Height = 21
          AutoFocus = False
          EditAlign = eaLeft
          EditType = etNumeric
          ErrorMarkerPos = 0
          ErrorMarkerLen = 0
          ErrorColor = clRed
          ErrorFontColor = clWhite
          ExcelStyleDecimalSeparator = False
          Flat = False
          FlatLineColor = clBlack
          FlatParentColor = True
          FocusAlign = eaDefault
          FocusBorder = False
          FocusColor = clWindow
          FocusFontColor = clWindowText
          FocusLabel = False
          FocusWidthInc = 0
          ModifiedColor = clHighlight
          DisabledColor = clWindow
          URLColor = clBlue
          ReturnIsTab = False
          LengthLimit = 0
          TabOnFullLength = False
          Precision = 0
          LabelPosition = lpLeftCenter
          LabelMargin = 4
          LabelTransparent = False
          LabelAlwaysEnabled = False
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = [fsBold]
          Lookup.CaseSensitive = False
          Lookup.Color = clWindow
          Lookup.DisplayCount = 4
          Lookup.Enabled = False
          Lookup.History = False
          Lookup.NumChars = 2
          Lookup.Multi = False
          Lookup.Separator = ';'
          Persistence.Enable = False
          Persistence.Location = plInifile
          Color = clWindow
          Enabled = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          HintShowLargeText = False
          ParentFont = False
          OleDropTarget = False
          OleDropSource = False
          Signed = False
          TabOrder = 0
          Text = '0'
          Transparent = False
          Visible = True
          Version = '2.6.2.1'
        end
        object RetractAxleLab: TStaticText
          Left = 466
          Top = 90
          Width = 24
          Height = 20
          Caption = '0.0'
          TabOrder = 1
        end
        object ExtractAxleLab: TStaticText
          Left = 466
          Top = 129
          Width = 24
          Height = 20
          Caption = '0.0'
          TabOrder = 2
        end
        object GageOnTrackMMEd: TAdvEdit
          Left = 89
          Top = 196
          Width = 71
          Height = 21
          AutoFocus = False
          EditAlign = eaLeft
          EditType = etNumeric
          ErrorMarkerPos = 0
          ErrorMarkerLen = 0
          ErrorColor = clRed
          ErrorFontColor = clWhite
          ExcelStyleDecimalSeparator = False
          Flat = False
          FlatLineColor = clBlack
          FlatParentColor = True
          FocusAlign = eaDefault
          FocusBorder = False
          FocusColor = clWindow
          FocusFontColor = clWindowText
          FocusLabel = False
          FocusWidthInc = 0
          ModifiedColor = clHighlight
          DisabledColor = clWindow
          URLColor = clBlue
          ReturnIsTab = False
          LengthLimit = 0
          TabOnFullLength = False
          Precision = 0
          LabelPosition = lpLeftCenter
          LabelMargin = 4
          LabelTransparent = False
          LabelAlwaysEnabled = False
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = [fsBold]
          Lookup.CaseSensitive = False
          Lookup.Color = clWindow
          Lookup.DisplayCount = 4
          Lookup.Enabled = False
          Lookup.History = False
          Lookup.NumChars = 2
          Lookup.Multi = False
          Lookup.Separator = ';'
          Persistence.Enable = False
          Persistence.Location = plInifile
          Color = clWindow
          Enabled = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          HintShowLargeText = False
          ParentFont = False
          OleDropTarget = False
          OleDropSource = False
          Signed = False
          TabOrder = 3
          Text = '0'
          Transparent = False
          Visible = True
          Version = '2.6.2.1'
        end
        object VoltsPerMMLab: TStaticText
          Left = 469
          Top = 161
          Width = 24
          Height = 20
          Caption = '0.0'
          TabOrder = 4
        end
        object FrontSide: TRadioButton
          Left = 81
          Top = 17
          Width = 139
          Height = 21
          Caption = 'Front Side'
          Checked = True
          TabOrder = 5
          TabStop = True
          OnClick = FrontSideClick
        end
        object RearSide: TRadioButton
          Left = 81
          Top = 47
          Width = 139
          Height = 21
          Caption = 'RearSide'
          TabOrder = 6
          OnClick = RearSideClick
        end
        object GageInMM: TStaticText
          Left = 474
          Top = 197
          Width = 12
          Height = 20
          Caption = '0'
          TabOrder = 7
        end
      end
    end
  end
  object MsgPanel: TPanel
    Left = 0
    Top = 508
    Width = 810
    Height = 114
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Visible = False
    object MsgMemo: TMemo
      Left = 1
      Top = 1
      Width = 808
      Height = 112
      Align = alClient
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object EM1Connection: TServerSocket
    Active = False
    Port = 5517
    ServerType = stNonBlocking
    OnThreadEnd = EM1ConnectionThreadEnd
    OnClientConnect = EM1ConnectionClientConnect
    OnClientDisconnect = EM1ConnectionClientDisconnect
    OnClientRead = EM1ConnectionClientRead
    OnClientError = EM1ConnectionClientError
    Left = 550
    Top = 416
  end
  object Applanix12: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Host = 'Applanix1'
    Port = 5605
    OnConnect = Applanix12Connect
    OnDisconnect = Applanix12Disconnect
    OnError = Applanix12Error
    Left = 456
    Top = 424
  end
  object Applanix320: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Host = 'Applanix2'
    Port = 5515
    OnConnect = Applanix320Connect
    OnDisconnect = Applanix320Disconnect
    OnError = Applanix320Error
    Left = 496
    Top = 424
  end
  object ADCTimer: TTimer
    Enabled = False
    OnTimer = ADCTimerTimer
    Left = 392
    Top = 424
  end
  object PPSTimer: TTimer
    Enabled = False
    OnTimer = PPSTimerTimer
    Left = 320
    Top = 424
  end
  object SimulationTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = SimulationTimerTimer
    Left = 272
    Top = 432
  end
  object ADTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = ADTimerTimer
    Left = 664
    Top = 424
  end
  object AdvEditEditLink: TAdvEditEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = True
    WantKeyUpDown = False
    WantKeyHomeEnd = True
    WantKeyPriorNext = False
    WantKeyReturn = False
    WantKeyEscape = False
    EditAlign = eaLeft
    EditColor = clWindow
    MaxLength = 0
    ModifiedColor = clRed
    EditType = etString
    ShowModified = False
    Precision = 0
    Signed = False
    ExcelStyleDecimalSeparator = False
    Left = 408
    Top = 8
  end
  object ToolIcons: TImageList
    Height = 24
    Width = 24
    Left = 560
    Top = 16
    Bitmap = {
      494C01010B000E00040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      800080808000808080008080800080808000808080008080800080808000FFFF
      FF00000000000000000000000000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000808080008080
      8000808080008080800080808000FFFFFF000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000080
      000000800000008000000080000000800000008000000080000000800000FFFF
      FF00000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000808080000000000000800000008000000080
      0000008000000080000000800000FFFFFF00FFFFFF0000000000000000000000
      0000000000000080000000800000008000000080000000800000008000000080
      0000008000000080000000800000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000080
      000000800000008000000080000000800000008000000080000000800000FFFF
      FF00000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000808080000000000000800000008000000080
      000000800000008000000080000000800000FFFFFF00FFFFFF00000000000000
      0000000000000000000000800000008000000080000000800000008000000080
      0000008000000080000000800000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000080
      000000800000008000000080000000800000008000000080000000800000FFFF
      FF00000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000808080000000000000800000008000000080
      00000080000000800000008000000080000000800000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000080
      000000800000008000000080000000800000008000000080000000800000FFFF
      FF00000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000808080000000000000800000008000000080
      0000008000000080000000800000008000000080000000800000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000008000000080
      0000008000000080000000800000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000080
      000000800000008000000080000000800000008000000080000000800000FFFF
      FF00000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000808080000000000000800000008000000080
      000000800000008000000080000000800000008000000080000000800000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000008000000080
      0000008000000080000000800000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000080
      000000800000008000000080000000800000008000000080000000800000FFFF
      FF00000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000808080000000000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000FFFFFF00FFFFFF00000000000000000000000000000000000080
      0000008000000080000000800000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000008000000080
      000000800000008000000080000000800000008000000080000000800000FFFF
      FF00000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000808080000000000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000FFFFFF00FFFFFF000000000000000000000000000080
      0000008000000080000000800000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000080000000FFFF000080
      000000FFFF000080000000FFFF000080000000FFFF000080000000800000FFFF
      FF00000000000000000000000000008000000080000000800000008000000080
      000000800000008000000080000000000000000000000080000000FFFF000080
      000000FFFF000080000000FFFF00000000000000000000000000008000000080
      0000008000000080000000800000FFFFFF000000000000000000000000000080
      0000008000000080000000800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000080000000FFFF000080
      000000FFFF000080000000FFFF00008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000080000000FFFF000080
      000000FFFF0000800000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      00000000000080808000808080008080800080808000808080000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000000000000000000000000000000000000000
      00008080800000FF000000FF000000FF000000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000080000000FF000000FF000000FF0000000000000000000000
      00008080800000FF000000FF000000FF000000FF00000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000FF000000FF000000FF000000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      00008080800000FF000000FF000000FF00000000FF000000FF000000FF008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000008080
      8000000000008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000808080008080800080808000808080008080
      80008080800000FF000000FF000000FF000000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000808080000000FF000000FF000000FF008080
      80008080800000FF000000FF00000000FF000000FF000000FF0000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF008080
      8000800000008080000080800000808000008080000080800000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF000000FF000000FF000000FF
      00008080800000FF000000FF000000FF000000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF00000000FF000000FF000000
      FF008080800000FF00000000FF000000FF000000FF0000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000008080800080808000808080000000
      FF00808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000008080800080808000808080000000
      FF00800000008080000080000000808000008000000080800000000000008080
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF000000FF000000FF000000FF
      00008080800000FF000000FF000000FF000000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF000000FF00000000FF000000
      FF000000FF000000FF000000FF000000FF0000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80000000FF000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000800000008080000080800000808000008080000080800000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF000000FF000000FF000000FF
      000000FF00008080800000FF000000FF000000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF000000FF000000FF00000000
      FF000000FF000000FF000000FF0000FF000000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000FF0000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080000000000000808000000000000080800000000000008080
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF000000FF000000FF000000FF
      000000FF00008080800000FF000000FF000000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF000000FF00000000FF000000
      FF000000FF000000FF000000FF000000FF0000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000000000000000000000FF00808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080000080800000808000008080000080800000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF000000FF000000FF000000FF
      000000FF00008080800000FF000000FF000000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF00000000FF000000FF000000
      FF0000FF0000808080000000FF000000FF000000FF0000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000008080800080808000808080008080
      80008080800080808000808080000000FF008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000008080800080808000808080008080
      8000000000008080000000000000808000000000000080800000000000008080
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF000000FF000000FF000000FF
      000000FF00008080800000FF000000FF000000FF000000FF000000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF00000000FF000000FF000000FF0000FF
      000000FF00008080800000FF00000000FF000000FF000000FF0000FF00008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000808080000000FF0000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080000080800000808000008080000080800000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF000000FF000000FF000000FF
      000000FF00008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008000000080000000FF000000FF000000FF0000FF000000FF
      000000FF00008080800080808000808080000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000000000000000000000000080808000000000000000FF00000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080000000000000000000000000000000000000000000008080
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF000000FF000000FF000000FF
      000000FF00008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080000000FF000000FF000000FF0000FF000000FF000000FF
      000000FF0000808080000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80000000000000000000000000008080800000000000000000000000FF008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080000080800000808000008080000080800000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000080000000800000FF000000FF000000FF000000FF000000FF
      000000FF00008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF0000FF000000FF000000FF000000FF
      000000FF000080808000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080000000
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000808000008080000080
      8000008080000080800000808000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000080
      8000008080000080800000808000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000008080
      8000000000008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000008080
      8000800000008080000080800000808000008080000080800000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00008000000080800000FFFFFF0080800000FFFFFF0080800000800000008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000008080
      8000800000008080000080800000808000008080000080800000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000008080
      8000800000008080000080000000808000008000000080800000800000008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF008080
      8000808080008080000080800000808000008080000080800000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000008080800080808000808080000000
      FF00808080008080800080808000808080008080800000000000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000008080800080808000808080000000
      FF00000000008080000000000000808000000000000080800000008080008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80000000FF000000000000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080000080800000808000008080000080800000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000FF0000000000808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080000000FFFF00000000000080800080808000008080008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000000000000000000000FF00808080000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000FFFF008080000080800000808000008080000080800000808000008080
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000008080800080808000808080008080
      80008080800080808000808080000000FF008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFF
      FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000
      FFFFFFFFF1FFFE001F000000FFFFFFFFE1FFFC001F000000FFFFFFFFE1FFFC00
      3F000000FC78FFFFE1FFFC1FFF000000FBB77FC00000C00000000000FBB77F80
      0000800000000000FBB77F800000800000000000FBB77F800000800000000000
      F8487F800000800000000000FDFF77800000800000000000FEEFB78000008000
      00000000FF6FD7800000800000000000FFAFEF800001800001000000FFDFFF80
      01FF801E1F000000FFFFFFFE01FFFC0C3F000000FFFFFFFE01FFFE003F000000
      FFFFFFFFC1FFFE007F000000FFFFFFFFE3FFFF81FF000000FFFFFFFFFFFFFFFF
      FF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFBFFF7FAEEEFFAEEEFF9FFFFF1FFE3FCEEEFFCEEEFF9F8
      1FF8F807F80007F80007F9F00FF8700FFE6EEFFE6EEFF9F00FF8300FFEAEEFFE
      A80FF8000FF8000FFECEEFFEC007F8000FF8000FF80007F80027F8000FF8000F
      FEE6EFFEE007F8000FF8000FFEEAEFFEEAA7F8000FF8000FFEECEFFEE007F800
      0FF8000FF80007F800A7F8000FF8000FFEEE6FFEE007F8001FF8001FFEEEAFFE
      EAE7F803FFF8038FFEEECFFEE807F803FFF803C7F80007F80EFFF807FFF007E3
      FFFFFFFFFFFFFFFFFFFBFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEAFFEEEAFFE000FFFFFFFFEEE
      AFFEEEAFFC018FFC007FF80007F80007FC018FFC003FFEEEEFFEEEEFFC018FFD
      001FFAEEEFFAE80FFC000FFC000FFCEEEFFCE007FC000FFD0007FA800FFA8007
      FC000FFC0007FE6EAFFE6007FC7F8FFD007FFEAEAFFEA007FC7F8FFC007FFECE
      AFFEC007FC7F8FFD007FF80007F80007FC7F8FFE3FC7FEE6AFFEE807FC7F8FFF
      FFE7FEEAEFFEE007FC7FAFFFFDD7FEECEFFEE007FC000FFFFE3FF80007F809FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
