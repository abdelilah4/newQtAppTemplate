package org.dreamdev.QtAdMob;
import android.graphics.Rect;
import android.view.Window ;
import org.qtproject.qt5.android.bindings.QtActivity;

public class JavaTools extends QtActivity
{
	private int statusBar(int i) {
		Rect rectgle= new Rect();
                Window window= getWindow();
		window.getDecorView().getWindowVisibleDisplayFrame(rectgle);
		int statusBar = rectgle.top;
		return statusBar;
	}
}
