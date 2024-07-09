package com.example.manager.activity;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.example.manager.R;

import java.util.HashMap;
import java.util.Map;

public class LienHeActivity extends AppCompatActivity {

    private static final int REQUEST_CALL_PERMISSION = 1;
    private Map<String, String> contactNumbers = new HashMap<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lien_he);

        initializeContactNumbers();

        String[] buttonIds = {"btncall1", "btnsms1", "btncall2", "btnsms2", "btncall3", "btnsms3"};
        for (String buttonId : buttonIds) {
            Button button = findViewById(getResources().getIdentifier(buttonId, "id", getPackageName()));
            button.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    String action = v.getId() == getResources().getIdentifier("btncall1", "id", getPackageName()) ||
                            v.getId() == getResources().getIdentifier("btncall2", "id", getPackageName()) ||
                            v.getId() == getResources().getIdentifier("btncall3", "id", getPackageName()) ? "call" : "sms";
                    String phoneNumber = contactNumbers.get(buttonId);
                    performAction(action, phoneNumber);
                }
            });
        }

        Button buttonFacebook = findViewById(R.id.buttonFacebook);
        buttonFacebook.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openWebPage("https://www.facebook.com/profile.php?id=100011968744036&mibextid=LQQJ4d");
            }
        });

        Button buttonZalo = findViewById(R.id.buttonZalo);
        buttonZalo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openWebPage("https://zalo.me/your_profile");
            }
        });
    }

    private void initializeContactNumbers() {
        contactNumbers.put("btncall1", "tel:0966147881");
        contactNumbers.put("btnsms1", "smsto:0966147881");
        contactNumbers.put("btncall2", "tel:0987654321");
        contactNumbers.put("btnsms2", "smsto:0987654321");
        contactNumbers.put("btncall3", "tel:0123456789");
        contactNumbers.put("btnsms3", "smsto:0123456789");
    }

    private void performAction(String action, String phoneNumber) {
        if (action.equals("call")) {
            if (ContextCompat.checkSelfPermission(LienHeActivity.this, Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
                ActivityCompat.requestPermissions(LienHeActivity.this, new String[]{Manifest.permission.CALL_PHONE}, REQUEST_CALL_PERMISSION);
            } else {
                Intent callIntent = new Intent(Intent.ACTION_CALL, Uri.parse(phoneNumber));
                startActivity(callIntent);
            }
        } else if (action.equals("sms")) {
            Intent smsIntent = new Intent(Intent.ACTION_SENDTO, Uri.parse(phoneNumber));
            startActivity(smsIntent);
        }
    }

    private void openWebPage(String url) {
        Intent webIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        startActivity(webIntent);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == REQUEST_CALL_PERMISSION) {
            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                // Permission granted, make the call again
                performAction("call", contactNumbers.get("btncall1"));
            } else {
                // Permission denied, handle accordingly
            }
        }
    }
}