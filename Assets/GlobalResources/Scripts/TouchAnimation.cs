using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TouchAnimation : MonoBehaviour
{
    static string myLog = "";
    private string debugLog;
    public GameObject currObj;

    Animator animator;

    // Start is called before the first frame update
    void Start()
    {
        animator = currObj.GetComponent<Animator>();

    }
    void OnGUI()
    {
        myLog = GUI.TextArea(new Rect(700, 0, 100, 100), debugLog);
    }
    // Update is called once per frame
    void Update()
    {
        if (Input.touchCount > 0)
        {
            Touch touch = Input.GetTouch(0);
            debugLog = "touch true";
            animator.SetBool("TouchBool", true);
            StartCoroutine(touchFalse());

            //animator.runtimeAnimatorController = Resources.Load<RuntimeAnimatorController>("afterTouch");
        }
    }

    private IEnumerator touchFalse()
    {
        debugLog = "wait10sec";
        yield return new WaitForSeconds(10);
        debugLog = "touchFalse";
        animator.SetBool("TouchBool", false);
    }
}
