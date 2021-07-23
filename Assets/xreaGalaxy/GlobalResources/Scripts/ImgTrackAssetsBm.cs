using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;

public class ImgTrackAssetsBm : MonoBehaviour
{
    static string myLog = "";
    private string debugLog;

    bool isLoaded = false;

    public ARTrackedImageManager _ARTImgMng;

    //¹æ¹ý1
    private Dictionary<string, GameObject> _DicObject = new Dictionary<string, GameObject>();
    public List<GameObject> _TargetListFromAssets;


    private void Awake()
    {
        Debug.Log("Awake");

        Debug.Log(_ARTImgMng);
    }

    private void OnEnable()
    {
        //image tracking event register
        _ARTImgMng.trackedImagesChanged += ImageTracked;
        Debug.Log("ENABLED");
        debugLog = "ENABLED";
    }

    private void OnDisable()
    {
        //image tracking event unload
        _ARTImgMng.trackedImagesChanged -= ImageTracked;
        Debug.Log("DISALBED");
        debugLog = "DISABLED";
    }

    void ImageTracked(ARTrackedImagesChangedEventArgs eventArgs)
    {

        foreach (ARTrackedImage artImg in eventArgs.added)
        {
            UpdateImg(artImg);
        }

        foreach (ARTrackedImage artImg in eventArgs.updated)
        {
            UpdateImg(artImg);
        }
    }

    public void ResetBtnClicked()
    {
        OnDisable();
    }

    void OnGUI()
    {
        myLog = GUI.TextArea(new Rect(500, 0, 100, 100), debugLog);
    }

    void UpdateImg(ARTrackedImage img)
    {
        //method 1: appear Prefab according to the TrackedImage
        if (_DicObject.ContainsKey(img.referenceImage.name))
        {

        }

        // if targeted Obj, show the object
        // ????: REMOVE OBJ METHOD NEEDED
        else
        {

            GameObject target = null;

            for (int i = 0; i < _TargetListFromAssets.Count; i++)
            {
                if (img.referenceImage.name == _TargetListFromAssets[i].name)
                {
                    target = _TargetListFromAssets[i];
                    break;
                }
            }

            //Active Object Destroy
            foreach(var obj in _DicObject) {
                obj.Value.SetActive(false);
                Destroy(obj.Value);
            }
            //Only One Object in _DicObject;
            //Init _DicObject;
            _DicObject.Clear();

            if (target != null)
            {
                if (img.referenceImage.name == "scene2Book")
                {
                    debugLog = img.referenceImage.name;

                    Quaternion rotation = Quaternion.Euler(new Vector3(img.transform.rotation.eulerAngles.x, img.transform.rotation.eulerAngles.y, img.transform.rotation.eulerAngles.z));
                    GameObject Obj = Instantiate(target, img.transform.position, rotation);
                    _DicObject.Add(img.referenceImage.name, Obj);
                }
                else
                {
                    debugLog = img.referenceImage.name;
                    // rotate x:90 degree because current marker is rotated in the scene
                    Quaternion rotation = Quaternion.Euler(new Vector3(img.transform.rotation.eulerAngles.x - 90, img.transform.rotation.eulerAngles.y, img.transform.rotation.eulerAngles.z));
                    GameObject Obj = Instantiate(target, img.transform.position, rotation);
                    _DicObject.Add(img.referenceImage.name, Obj);
                }

            }
        }
    }
}
