#Load the GDI+ and WinForms Assemblies
[reflection.assembly]::LoadWithPartialName( "System.Windows.Forms")
[reflection.assembly]::LoadWithPartialName( "System.Drawing")

# Create pen and brush objects 
$myBrush = new-object Drawing.SolidBrush Grey
$mypen = new-object Drawing.Pen black

# Create a Rectangle object for use when drawing rectangle
$rect = new-object Drawing.Rectangle 0, 0, 200, 200

# Create a Rectangle object for use when drawing rectangle
$rect1 = new-object Drawing.Rectangle 0, 0, 200, 200

# Create a Rectangle object for use when drawing rectangle
$rect2 = new-object Drawing.Rectangle 0, 0, 200, 200

# Create a Rectangle object for use when drawing rectangle
$rect3 = new-object Drawing.Rectangle 0, 0, 200, 200

# Create a Form
$form = New-Object Windows.Forms.Form

# Get the form's graphics object
$formGraphics = $form.createGraphics()


# Define the paint handler
$form.add_paint(
{

$mypen.color = "red" # Set the pen color
$mypen.width = 5     # ste the pen line width


$formGraphics.FillRectangle($myBrush, 0,0,192,120)
$formGraphics.FillRectangle($myBrush, -160,0,160,120)
$formGraphics.FillRectangle($myBrush, 190,0,128,102)


}
)

$form.ShowDialog()   # display the dialog

