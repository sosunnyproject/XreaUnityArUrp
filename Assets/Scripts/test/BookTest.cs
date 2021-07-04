using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;

public class BookTest : MonoBehaviour
{
    public GameObject _Target;


    private void OnGUI() {
        if (GUI.Button(new Rect(0,0, 100, 50), "test")) {

            _Target.transform.localRotation = Quaternion.Euler(90, 0, 0);

        }
    }

    private void Awake() {
        //_ARTIMng.trackedImagesChanged += UpdateImg;
    }
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
